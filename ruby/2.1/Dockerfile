# Ruby
#
# VERSION               0.0.1
#
# docker build -t yuanying/ruby:2.1 .

FROM      yuanying/ruby:base
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN curl http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz | tar zxvf -
RUN cd ruby-2.1.1 && ./configure && make && make install && gem install --no-ri --no-rdoc bundler
