# docker build -t yuanying/dir_image .
# docker run -d -v /volumes/images:/var/images -p 9873:9873 yuanying/dir_image
FROM ruby:2.1.5
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

VOLUME ["/var/images"]
EXPOSE 9873

RUN apt-get update && apt-get install -y libfreeimage-dev
RUN git clone https://github.com/yuanying/dir_image.git
WORKDIR /dir_image
RUN bundle install
ADD config.yml /dir_image/configs/config.yml

# ENV RACK_ENV production
ENTRYPOINT ["bundle", "exec", "rackup"]
CMD ["--host", "0.0.0.0", "-p", "9873", "-s", "thin", "config.ru"]