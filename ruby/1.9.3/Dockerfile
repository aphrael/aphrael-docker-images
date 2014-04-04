# Ruby
#
# VERSION               0.0.1
#
# docker build -t yuanying/ruby:1.9.3 .

FROM      yuanying/ruby:base
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN curl http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz | tar zxvf -
RUN cd yaml-0.1.4 && ./configure && make && make install
RUN curl ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p545.tar.gz | tar zxvf -
RUN cd ruby-1.9.3-p545 && ./configure && make && make install && gem install --no-ri --no-rdoc bundler
