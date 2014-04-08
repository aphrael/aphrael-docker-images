# docker build -t yuanying/grack .
# docker run -d -v /home/yuanying/repos:/var/repos -p 9872:9872 yuanying/grack
FROM yuanying/ruby:2.1
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

# RUN mkdir /grack
WORKDIR /tmp
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install --vendor/cache

ADD . /grack
VOLUME ["/var/repos"]
EXPOSE 9872

WORKDIR /grack

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9872", "config.ru"]