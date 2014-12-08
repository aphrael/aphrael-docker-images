# docker build -t yuanying/pdns-mysql .
# docker run -d -p 53:53 -p 53:53/udp -e "MYSQL_ROOT_PASSWORD=mysqlsecret" \
#        -e "PDNS_MYSQL_DB_NAME=pdns" \
#        -e "PDNS_MYSQL_DB_USER=pdns" \
#        -e "PDNS_MYSQL_DB_PASSWORD=password" \
#        --link mysql-container:mysql yuanying/pdns-mysql

FROM ubuntu:trusty
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y pdns-backend-mysql
ADD pdns.conf /etc/powerdns/pdns.conf
ADD create-user.sql /etc/powerdns/create-user.sql
ADD pdns.sql /etc/powerdns/pdns.sql

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 53
EXPOSE 53/udp

CMD ["/usr/local/bin/run"]

