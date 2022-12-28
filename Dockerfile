FROM ruby:3.2.0-alpine

ENV S3_KEY ""
ENV S3_PRIVATE_KEY ""
ENV FlAG "all"
ENV EXT ""

RUN mkdir -pv ~/.s3
RUN gem install bundler
RUN apk update && \
    apk add --no-cache build-base
RUN mkdir /downloader
WORKDIR /downloader
ADD . /downloader
RUN bundler install
CMD ["rake", "docker"]
