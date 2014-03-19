# Ruby
#
# VERSION               0.0.1
#
# docker build -t yuanying/ruby:base .

FROM      ubuntu
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs subversion libmysqlclient-dev libpq-dev libffi-dev imagemagick
