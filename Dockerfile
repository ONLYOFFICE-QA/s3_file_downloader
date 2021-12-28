FROM ruby:3.1.0

ENV S3_KEY ""
ENV S3_PRIVATE_KEY ""
ENV FlAG "all"
ENV EXT ""

RUN mkdir -pv ~/.s3
RUN gem install bundler
RUN mkdir /downloader
WORKDIR /downloader
ADD . /downloader
RUN bundler install
CMD ["rake", "docker"]
