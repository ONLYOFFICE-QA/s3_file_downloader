# frozen_string_literal: true

require_relative 'main'
require_relative 'lib/validation/validator'

desc 'Download files'
task :download, :download_flag, :extension do |_t, args|
  # args.with_defaults(download_param: 'doc')
  download_flag = args[:download_flag].to_s
  extension = args[:extension].to_s
  Validator.new.validator_for_download(download_flag, extension)
end
