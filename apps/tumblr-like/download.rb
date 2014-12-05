#!/usr/bin/env ruby
require 'open-uri'
require 'tumblr_client'
require 'fileutils'

year          = Date.today.strftime('%Y')
script_dir    = File.expand_path(File.dirname(__FILE__))
contents_path = File.join(script_dir, 'contents')

FileUtils.mkdir_p(contents_path)

timestamp_file = File.join(contents_path, '.timestamp')
timestamp = 0

open(timestamp_file) do |io|
  timestamp = io.read.to_i
end if File.exists?(timestamp_file)

Tumblr.configure do |config|
  config.consumer_key       = ENV['TUMBLR_CONSUMER_KEY']
  config.consumer_secret    = ENV['TUMBLR_CONSUMER_SECRET']
  config.oauth_token        = ENV['TUMBLR_CONSUMER_TOKEN']
  config.oauth_token_secret = ENV['TUMBLR_CONSUMER_TOKEN_SECRET']
end

client          = Tumblr::Client.new
offset          = 0
saved_timestamp = nil

while true do
  likes = client.likes(offset: offset)
  likes['liked_posts'].each do |like|
    current_timestamp = like['timestamp']
    unless saved_timestamp
      open(timestamp_file, 'w') do |io|
        saved_timestamp = current_timestamp
        io.write saved_timestamp
      end
    end
    if current_timestamp <= timestamp
      exit 0
    end

    puts "like! #{current_timestamp}"
    next unless like['type'] == 'photo'
    like['photos'].each do |photo|
      begin
        url = photo['original_size']['url']
        filename = File.basename(url)
        filename = "#{9999999999999 - current_timestamp}-#{filename}"
        filedir  = "#{contents_path}/#{year}"
        FileUtils.mkdir_p(filedir) unless File.directory?(filedir)
        filepath = "#{filedir}/#{filename}"
        unless File.exists?(filepath)
          open(url) do |input|
            open(filepath, 'w') do |output|
              output.write input.read
            end
          end
          sleep 1
        else
          puts "Skipped: #{filename}"
        end
      rescue => ex
        p ex
        puts "Can't download #{like['post_url']}"
      end
    end
    url = like['photos']
  end

  puts '========================================'

  offset += likes['liked_posts'].size
  if offset >= likes['liked_count']
    exit 0
  end
  if likes['liked_posts'].size == 0
    exit 0
  end
end
