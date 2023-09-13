# downloader

## Description

Script for downloading files from aws.amazon.com

## Running in a docker

### Running Docker Image

#### For linux

  ```bash
  docker run -v <the path to the downloaded files>:/downloader/tmp \
  -e S3_KEY=<is a public s3 key for getting files> \
  -e S3_PRIVATE_KEY=<is a private s3 key for getting files> onlyoffice/s3_file_downloader:latest
  ```

#### For Windows

Open CMD as administrator and insert the command

```bash
  docker run -v %USERPROFILE%\Downloads\s3_files:/downloader/tmp ^
   -e S3_KEY=<is a public s3 key for getting files> ^
   -e S3_PRIVATE_KEY=<is a private s3 key for getting files> onlyoffice/s3_file_downloader:latest
 ```

the files will be downloaded to Downloads\s3_files folder

#### Additional options for downloading files, add to the start command

``-e EXT=<download extension>`` - To download files by extension.
``-e THREADS=<download extension>`` - Sets the number of threads to download files.
By default 8.
An example of a startup with additional options

* For linux

  ```bash
  docker run -v <the path to the downloaded files>:/downloader/tmp \
  -e S3_KEY=<is a public s3 key for getting files> \
  -e S3_PRIVATE_KEY=<is a private s3 key for getting files> \
  -e EXT=ppt onlyoffice/s3_file_downloader:latest \
  -e THREADS=12
  ```

* For Windows

  ```bash
  docker run -v <the path to the downloaded files>:/downloader/tmp ^
  -e S3_KEY=<is a public s3 key for getting files> ^
  -e S3_PRIVATE_KEY=<is a private s3 key for getting files> ^
  -e EXT=ppt onlyoffice/s3_file_downloader:latest ^
  -e THREADS=12
  ```

## Running without a docker

### Requirements

* Ruby

### Installation

``bundle install``

### Usage

To change the number of file download threads,
change the `threads` parameter in `./config.json`.

``rake download[all]`` - To download all files

``rake download[file]`` - To download files. Reading the array of files comes
from `./data/files_to_download.list`

``rake download[ext,your extension]`` - To download files by extension.
You must specify the extension, the second parameter.

``rake download[arrext]`` -  To download files by extensions from array.
The array is in the file `./config.json`. Change `extensions_array`.

``rake download[arrfile]`` -  To download files by file names from array.
The array is in the file ``./config.json``. Change `file_names_array`.

### the files will be downloaded to the tmp folder
