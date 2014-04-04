# Ruby
#
# VERSION               0.0.1
#
# docker build -t yuanying/ruby:2.0.0 .

FROM      yuanying/ruby:base
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN curl ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz | tar zxvf -
RUN cd ruby-2.0.0-p451 && ./configure && make && make install && gem install --no-ri --no-rdoc bundler
