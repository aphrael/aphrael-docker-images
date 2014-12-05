# docker build -t yuanying/grack .
# docker run -d -v /home/yuanying/repos:/var/repos -p 9872:9872 yuanying/grack
FROM ruby:2.1.5-onbuild
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

VOLUME ["/var/repos"]
EXPOSE 9872

ENV RACK_ENV production
ENTRYPOINT ["bundle", "exec", "rackup"]
CMD ["--host", "0.0.0.0", "-p", "9872", "-s", "thin", "config.ru"]