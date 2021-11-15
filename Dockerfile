FROM ruby:3.0

ENV S3_KEY ""
ENV S3_PRIVATE_KEY ""
ENV FlAG "all"
ENV EXT ""

RUN mkdir -pv ~/.s3
RUN apt update && apt install -y libmagic-dev
RUN gem install bundler
RUN gem update --system
RUN mkdir /downloader
WORKDIR /downloader
ADD . /downloader
RUN gem install bundler
RUN bundler install
CMD ["rake", "docker"]
