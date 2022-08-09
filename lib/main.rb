# frozen_string_literal: true

require 'logger'
require 'onlyoffice_s3_wrapper'
require_relative '../data/static_data'

# Methods for download files
class Downloader
  def initialize
    @tmp_dir = './tmp'
    FileUtils.makedirs(@tmp_dir)
    @logger = Logger.new("#{@tmp_dir}/Failed_download_log")
    @logger_stdout = Logger.new($stdout)
  end

  def s3
    @s3 ||= OnlyofficeS3Wrapper::AmazonS3Wrapper.new(bucket_name: 'conversion-testing-files', region: 'us-east-1')
  end

  # The method checks the existence of the directory,
  # and if it does not exist, creates a new one using the name as a parameter
  def create_dir(dir_name)
    return if File.exist? dir_name

    FileUtils.makedirs(dir_name)
    puts "Directory #{dir_name} created"
  end

  def download(array_of_files)
    array_of_files.each do |filename|
      dir_name = filename.split('/')[0]
      if File.exist? "#{@tmp_dir}/#{filename}"
        @logger_stdout.info("File `#{filename}` already downloaded")
      else
        create_dir("#{@tmp_dir}/#{dir_name}")
        @logger_stdout.info("Starting to download a file: #{filename}")
        begin
          s3.download_file_by_name(filename, "#{@tmp_dir}/#{dir_name}")
        rescue StandardError => e
          @logger_stdout.error("Error: '#{e}' happened while downloading #{filename}")
          @logger.error("Error: '#{e}' happened while downloading #{filename}")
        end
      end
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
    array_of_files = s3.files_from_folder(extension.to_s)
    download(array_of_files)
  end

  def download_by_array_extension
    StaticData::EXTENSION_ARRAY.each do |extension|
      array_of_files = s3.files_from_folder(extension.to_s)
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
