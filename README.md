# downloader

## Description

Script for downloading files from aws.amazon.com

## Requirements:

* Ruby

## Installation

```bundle install```

## Usage

Commands for running:

```rake download[download_flag,extension] ```

### download_flag

```all``` - To download all files

```file``` - To download files. Reading the array of files comes from "./array_of_files.txt"

```ext``` - To download files by extension.  You must specify the extension

```arrext``` -  To download files by extensions from array.
The array is in the file "./data/static_data.rb". Change "EXTENSION_ARRAY"

```arrfile``` -  To download files by file names from array. The array is in the file "./data/static_data.rb".
Change "FILE_NAMES_ARRAY".')

### extension

Used with the flag ```ext``` to pass the expansion

Example: ```rake download[ext,doc]```
