# downloader

## Description

Script for downloading files from aws.amazon.com

## Requirements:

* Ruby

## Installation

```bundle install```

# Usage

Commands for running:

```rake download_all```  - For download all files

```rake download_from_file```  - For download files. Reading the array of files comes from "./example.txt"

```rake download_by_prefix extension=doc```  - For download files by extension. Example command: "rake download_by_extension extension=csv"

```rake download_by_array_extension```  - For download files by extensions from array. The array is in the file "./variables.rb". Change "@arr_extension"

```rake download_by_array_filenames```  - For download files by file names from array. The array is in the file "./variables.rb". Change "@arr_file_names"
