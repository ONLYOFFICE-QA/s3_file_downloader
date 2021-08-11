# frozen_string_literal: true

require 'onlyoffice_s3_wrapper'

FileUtils.makedirs('./tmp')
@tmp_dir = './tmp'
@arr = %w[doc csv]

def s3
  @s3 ||= OnlyofficeS3Wrapper::AmazonS3Wrapper.new(bucket_name: 'conversion-testing-files', region: 'us-east-1')
end

def download(lib)
  lib.each do |el|
    el.sub!(/['\n']?$/, '')
    p("Starting downloading file: #{el}")
    # print(el)
    s3.download_file_by_name(el, @tmp_dir)
  end
end

def download_all
  filename = s3.get_files_by_prefix()
  download(filename)
end

def download_from_file
  filename_from_txt = []
  File.open("example.txt", "r") do |file|
    file.readlines().each do |line|
      filename_from_txt.push(line)
    end
  end
  download(filename_from_txt)
end

def download_by_prefix(prefix)
  filename = s3.get_files_by_prefix("#{prefix}/")
  download(filename)
end

def download_by_array
  @arr.each do |el|
    filename = s3.get_files_by_prefix("#{el}/")
    download(filename)
  end
end


