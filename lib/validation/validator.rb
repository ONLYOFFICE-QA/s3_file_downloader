# frozen_string_literal: true

# use Validator.new.validator_for_download
class Validator
  def validator_for_download(download_flag, extension)
    case download_flag
    when :all
      Downloader.new.download_all
    when :file
      Downloader.new.download_from_file
    when :ext
      puts('Please, enter extension. Example: rake download[ext,<extension>]') if extension == ''
      Downloader.new.download_by_extension(extension)
    when :arrext
      Downloader.new.download_by_array_extension
    when :arrfile
      Downloader.new.download_by_array_filenames
    else
      message = 'Input Error' \
                    'Please,enter the correct parameters' \
                    'Example: rake download[parameter,extension]'
      puts(message)
    end
  end
end
