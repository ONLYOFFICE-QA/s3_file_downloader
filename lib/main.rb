# frozen_string_literal: true

require 'onlyoffice_s3_wrapper'
require_relative '../data/static_data'

# Methods for download files
class Downloader
  def initialize
    @tmp_dir = './tmp'
    FileUtils.makedirs(@tmp_dir)
  end

  def s3
    @s3 ||= OnlyofficeS3Wrapper::AmazonS3Wrapper.new(bucket_name: 'conversion-testing-files', region: 'us-east-1')
  end

  def download(array_of_files)
    array_of_files.each do |filename|
      p("Starting downloading file: #{filename}")
      s3.download_file_by_name(filename, @tmp_dir)
    end
  end

  def download_all
    array_of_files = s3.get_files_by_prefix
    download(array_of_files)
  end

  def download_from_file
    array_of_files = []
    File.open('./data/files_to_download.list', 'r') do |file|
      file.readlines.each do |line|
        line.sub!("\n", '')
        array_of_files.push(line)
      end
    end
    download(array_of_files)
  end

  def download_by_extension(extension)
    array_of_files = s3.get_files_by_prefix("#{extension}/")
    download(array_of_files)
  end

  def download_by_array_extension
    StaticData::EXTENSION_ARRAY.each do |extension|
      array_of_files = s3.get_files_by_prefix("#{extension}/")
      download(array_of_files)
    end
  end

  def download_by_array_filenames
    download(StaticData::FILE_NAMES_ARRAY)
  end

  def download_with_options(download_flag, extension)
    case download_flag
    when :all
      download_all
    when :file
      download_from_file
    when :ext
      puts('Please, enter extension. Example: rake download[ext,<extension>]') if extension == ''
      download_by_extension(extension)
    when :arrext
      download_by_array_extension
    when :arrfile
      download_by_array_filenames
    else
      message = 'Input Error' \
                    'Please,enter the correct parameters' \
                    'Example: rake download[parameter,extension]'
      puts(message)
    end
  end
end
