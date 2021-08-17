# frozen_string_literal: true

require_relative 'lib/main'

desc 'Download files'
task :download, :download_flag, :extension do |_t, args|
  download_flag = args[:download_flag].to_sym
  extension = args[:extension].to_s
  Downloader.new.download_with_options(download_flag, extension)
end
