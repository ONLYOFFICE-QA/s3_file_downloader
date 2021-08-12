# frozen_string_literal: true

require_relative 'main'
desc 'Download files'
task :download, :download_flag, :download_param do |_t, args|
  args.with_defaults(download_param: 'doc')
  download_flag = args[:download_flag].to_s
  download_param = args[:download_param].to_s

  case download_flag
  when 'all'
    download_all
  when 'file'
    download_from_file
  when 'ext'
    download_by_extension(download_param)
  when 'arrext'
    download_by_array_extension
  when 'arrfile'
    download_by_array_filenames
  else
    puts('Input Error
Please, the correct parameters
Example: rake download[parameter,extension]
all - For download all files
file - For download files. Reading the array of files comes from "./array_of_files.txt"
ext - For download files by extension.Default extension = "doc".Change extension can be second parameter
arrext -  For download files by extensions from array.
The array is in the file "./variables.rb". Change "@arr_extension"
arrfile -  For download files by file names from array. The array is in the file "./variables.rb".
Change "@arr_file_names".')
  end
end
