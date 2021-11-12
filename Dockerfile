FROM ruby:3.0
ENV S3_KEY ""
ENV S3_PRIVATE_KEY ""

RUN mkdir -pv ~/.s3 && \
    echo $S3_KEY > ~/.s3/key && \
    echo $S3_PRIVATE_KEY > ~/.s3/private_key
RUN apt update && apt install -y libmagic-dev
RUN gem install bundler
RUN gem update --system
RUN mkdir /downloader
WORKDIR /downloader
ADD . /downloader
RUN gem install bundler
RUN bundler install
