use Rack::ShowExceptions

require 'grack'
require 'git_adapter'

config = {
  :project_root => "/var/repos",
  :adapter => Grack::GitAdapter,
  :git_path => '/usr/bin/git',
  :upload_pack => true,
  :receive_pack => true,
}

run Grack::App.new(config)