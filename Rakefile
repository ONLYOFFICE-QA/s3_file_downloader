# frozen_string_literal: true

require_relative 'lib/main'

desc 'Download files'
task :download, :download_flag, :extension do |_t, args|
  download_flag = args[:download_flag].to_sym
  extension = args[:extension].to_s
  Downloader.new.download_with_options(download_flag, extension)
end

desc 'Download files for docker'
task :docker do |_t|
  download_flag = if ENV['EXT'] != ''
                    :ext
                  else
                    ENV['FlAG'].to_sym
                  end
  extension = ENV['EXT'].to_s
  downloader = Downloader.new
  downloader.key_writer
  downloader.download_with_options(download_flag, extension)
end
