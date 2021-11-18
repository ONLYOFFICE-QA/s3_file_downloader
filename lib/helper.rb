# frozen_string_literal: true

# Helper
class Helper
  def self.init_s3_from_env
    home = Dir.home
    file_writer("#{home}/.s3/key", ENV['S3_KEY'], 'w')
    file_writer("#{home}/.s3/private_key", ENV['S3_PRIVATE_KEY'], 'w')
  end

  def self.file_writer(path_to_file, text, write_param)
    file_writer = File.new(path_to_file, "#{write_param}:UTF-8")
    file_writer.print(text)
    file_writer.close
  end
end
