# downloader

## Description

Script for downloading files from aws.amazon.com

## Requirements:

* Ruby

## Getting Started
###Change dockerfile and docker-compose file.

* Set 2 environment variables in dockerfile:

     - **S3_KEY** - is a public s3 key for getting files
     - **3_PRIVATE_KEY** - is a private s3 key for getting files
  
###Change value ``command``  in the docker-compose.yml file to load files
  
Examples of Commands:

```["rake", "download[all]"]``` - To download all files

```["rake", "download[file]"]``` - To download files. Reading the array of files comes from "./data/files_to_download.list"

```["rake", "download[ext,your extension]"]``` - To download files by extension.  You must specify the extension, the second parameter.

```["rake', "download[arrext]"]``` -  To download files by extensions from array.
The array is in the file "./data/static_data.rb". Change "EXTENSION_ARRAY"

```["rake", "download[arrfile]"]```-  To download files by file names from array. The array is in the file "./data/static_data.rb".
Change "FILE_NAMES_ARRAY".'

Then, run docker-compose for download files

``docker-compose up``

The files will be downloaded to "downloaded_files" folder. 
