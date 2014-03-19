# MongoDB Image for MeteorHacks
#
# VERSION               0.0.1
#
# docker build -t yuanying/mongodb:2.4.5 .
# docker run -d -v /home/yuanying/mongodb/data:/data -p 27017:27017 yuanying/mongodb:2.4.5

FROM ubuntu
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl
RUN apt-get update -y
RUN apt-get install mongodb-10gen=2.4.5

EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]