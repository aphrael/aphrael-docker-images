# Node.js
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs
