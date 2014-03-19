# MySQL
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

ADD my.cnf /etc/mysql/my.cnf
RUN apt-get update

RUN apt-get install -y -o Dpkg::Options::="--force-confold" mysql-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y mysql-server

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]
EXPOSE 3306

CMD ["/usr/local/bin/run"]
