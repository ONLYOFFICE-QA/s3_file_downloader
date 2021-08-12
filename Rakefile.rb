# frozen_string_literal: true

require_relative 'main'
desc 'Download all files'
task :download_all do |_t|
  download_all
end

desc 'For download files Reading the array of files comes from "./example.txt"'
task :download_from_file do |_t|
  download_from_file
end

desc 'Download files by extension Example command: "rake download_by_prefix extension=csv"'
# rake download_by_prefix extension=csv
task :download_by_extension do |_t|
  extension = ENV['extension']
  download_by_extension(extension)
end

desc 'Download files by extensions from array'
task :download_by_array_extension do |_t|
  download_by_array_extension
end

desc 'Download files by filenames from array'
task :download_by_array_filenames do |_t|
  download_by_array_filenames
end
