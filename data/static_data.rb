# frozen_string_literal: true

# class with some constants and static data
class StaticData
  EXTENSION_ARRAY = JSON.load_file(File.join(Dir.pwd, 'config.json'))['extensions_array'].freeze
  FILE_NAMES_ARRAY = JSON.load_file(File.join(Dir.pwd, 'config.json'))['file_names_array'].freeze
end
