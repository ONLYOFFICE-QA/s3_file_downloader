# frozen_string_literal: true

require_relative 'lib/main'
require_relative 'lib/validation/validator'

desc 'Download files'
task :download, :download_flag, :extension do |_t, args|
  download_flag = args[:download_flag].to_sym
  extension = args[:extension].to_s
  Validator.new.validator_for_download(download_flag, extension)
end
