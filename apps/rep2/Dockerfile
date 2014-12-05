# VERSION               0.0.1
#
# docker build -t yuanying/rep2 .
# docker run -d -v /home/yuanying/rep2/data:/p2-php/data -v /home/yuanying/rep2/ic:/p2-php/rep2/ic  -p 8080:8080 yuanying/rep2

FROM ubuntu:precise
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:ondrej/php5
RUN apt-get update
RUN apt-get -y install php5 php5-curl php5-mysql php5-sqlite git-core curl

RUN git clone https://github.com/rsky/p2-php.git
WORKDIR /p2-php
RUN sed -e "s/pear-pear/pear-pear.php.net/g" composer.json > composer.json.new && mv -f composer.json.new composer.json
RUN curl -O http://getcomposer.org/composer.phar && php -d detect_unicode=0 composer.phar install
WORKDIR /p2-php/rep2

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 8080
CMD ["/usr/local/bin/run"]

