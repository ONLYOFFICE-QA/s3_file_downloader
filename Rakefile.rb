# frozen_string_literal: true

require_relative 'main'
desc 'convert files from custom configure.json'
# rake convert
task :download_all do |_t|
  download_all
end

task :download_from_file do |_t|
  download_from_file
end

task :download_by_prefix do |_t|
  puts 'Please enter the file extension: '
  extension = ENV['extension']
  download_by_prefix(extension)
end

task :download_by_array do |_t|
  download_by_array
end

