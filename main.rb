# frozen_string_literal: true

require 'onlyoffice_s3_wrapper'

filename_from_txt = []
filename = s3.get_files_by_prefix('doc/')
FileUtils.makedirs('./tmp')
@tmp_dir = './tmp'

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


File.open("text.txt", "r") do |file|
  file.readlines().each do |line|
    filename_from_txt.push(line)
  end
end

download(filename)

