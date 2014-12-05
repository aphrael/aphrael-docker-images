# docker build -t yuanying/tumblr-like .
# docker run -d -v /volumes/downloads:/usr/src/app/contents yuanying/tumblr-like
FROM ruby:2.1.5-onbuild
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

VOLUME ["/usr/src/app/contents"]

ENV TUMBLR_CONSUMER_KEY "XXXXX"
ENV TUMBLR_CONSUMER_SECRET "XXXXX"
ENV TUMBLR_CONSUMER_TOKEN "XXXXX"
ENV TUMBLR_CONSUMER_TOKEN_SECRET "XXXXX"

CMD ["bundle", "exec", "ruby", "download.rb"]
