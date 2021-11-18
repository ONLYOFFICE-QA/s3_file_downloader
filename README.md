# downloader

## Description

Script for downloading files from aws.amazon.com

## Running in a docker

### Requirements:

* Docker

### Getting Started

* First you need to build a docker image

  ```sudo docker build -t s3_file_downloader .```

* Then, to download all the files, run

  ```
  sudo docker run -v <the path to the downloaded files>:/downloader/tmp \
  -e S3_KEY=<is a public s3 key for getting files> \
  -e S3_PRIVATE_KEY=<is a private s3 key for getting files> s3_file_downloader
  ```

* Additional options for downloading files, add to the start command.

```-e EXT=<download extension>``` - To download files by extension. 

An example of a startup with additional options


  ```
  sudo docker run -v <the path to the downloaded files>:/downloader/tmp \
  -e S3_KEY=<is a public s3 key for getting files> \
  -e S3_PRIVATE_KEY=<is a private s3 key for getting files>  \
  -e EXT=ppt s3_file_downloader
  ```


## Running without a docker

## Requirements:

* Ruby

## Installation

```bundle install```

## Usage

```rake download[all]``` - To download all files

```rake download[file]``` - To download files. Reading the array of files comes from "./data/files_to_download.list"

```rake download[ext,your extension]``` - To download files by extension.  You must specify the extension, the second parameter.

```rake download[arrext]``` -  To download files by extensions from array.
The array is in the file "./data/static_data.rb". Change "EXTENSION_ARRAY"

```rake download[arrfile]``` -  To download files by file names from array. The array is in the file "./data/static_data.rb".
Change "FILE_NAMES_ARRAY".')

### the files will be downloaded to the tmp folder
