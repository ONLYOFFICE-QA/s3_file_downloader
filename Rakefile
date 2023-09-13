# frozen_string_literal: true

require_relative 'lib/main'
require_relative 'lib/config'

desc 'Download files'
task :download, :download_flag, :extension do |_t, args|
  download_flag = args[:download_flag].to_sym
  extension = args[:extension].to_s
  treads = JSON.load_file(File.join(Dir.pwd, 'config.json'))['threads'].to_i
  Downloader.new(threads_count: treads).download_with_options(download_flag, extension)
end

desc 'Download files for docker'
task :docker do |_t|
  download_flag = if ENV['EXT'] == ''
                    ENV['FlAG'].to_sym
                  else
                    :ext
                  end
  extension = ENV['EXT'].to_s
  treads = ENV['THREADS'].to_i
  Config.init_s3_from_env
  Downloader.new(threads_count: treads).download_with_options(download_flag, extension)
end
