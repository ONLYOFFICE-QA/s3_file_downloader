# downloader

## Description

Script for downloading files from aws.amazon.com

## Requirements:

* Ruby

## Installation

```bundle install```

## Usage

```rake download[all]``` - To download all files

```rake download[file]``` - To download files. Reading the array of files comes from "./array_of_files.txt"

```rake download[ext,your extension]``` - To download files by extension.  You must specify the extension, the second parameter.

```rake download[arrext]``` -  To download files by extensions from array.
The array is in the file "./data/static_data.rb". Change "EXTENSION_ARRAY"

```rake download[arrfile]``` -  To download files by file names from array. The array is in the file "./data/static_data.rb".
Change "FILE_NAMES_ARRAY".')
