# Ruby
#
# VERSION               0.0.1
#
# docker build -t yuanying/ruby:1.8.7 .

FROM      yuanying/ruby:base
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN curl http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p374.tar.gz | tar zxvf -
RUN cd ruby-1.8.7-p374 && ./configure && make && make install
RUN curl http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz | tar zxvf -
RUN cd rubygems-1.6.2 && ruby setup.rb
RUN gem install --no-ri --no-rdoc bundler
