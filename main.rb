# frozen_string_literal: true

require 'onlyoffice_s3_wrapper'
require_relative 'data/static_data'

# Methods for download files
class Downloader
  def initialize
    FileUtils.makedirs('./tmp')
    @tmp_dir = './tmp'
  end

  def s3
    @s3 ||= OnlyofficeS3Wrapper::AmazonS3Wrapper.new(bucket_name: 'conversion-testing-files', region: 'us-east-1')
  end

  def download(lib)
    lib.each do |el|
      p("Starting downloading file: #{el}")
      s3.download_file_by_name(el, @tmp_dir)
    end
  end

  def download_all
    filename = s3.get_files_by_prefix
    download(filename)
  end

  def download_from_file
    filename_from_txt = []
    File.open("array_of_files.txt", "r") do |file|
      file.readlines.each do |line|
        line.sub!("\n", '')
        filename_from_txt.push(line)
      end
    end
    download(filename_from_txt)
  end

  def download_by_extension(extension)
    filename = s3.get_files_by_prefix("#{extension}/")
    download(filename)
  end

  def download_by_array_extension
    StaticData::EXTENSION_ARRAY.each do |el|
      filename = s3.get_files_by_prefix("#{el}/")
      download(filename)
    end
  end

  def download_by_array_filenames
    download(StaticData::FILE_NAMES_ARRAY)
  end
end
