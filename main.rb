# frozen_string_literal: true

require 'onlyoffice_s3_wrapper'

def s3
  @s3 ||= OnlyofficeS3Wrapper::AmazonS3Wrapper.new(bucket_name: 'conversion-testing-files', region: 'us-east-1')
end

files = s3.get_files_by_prefix('doc/')
FileUtils.makedirs("./tmp")
@tmp_dir = './tmp'

files.each do |el|
  print(el)
  s3.download_file_by_name(el, @tmp_dir)
end
