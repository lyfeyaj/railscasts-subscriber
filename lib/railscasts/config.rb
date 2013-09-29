module RailsCasts
  # Global settings for RailsCasts
  def self.config
    @config ||= Configuration.new
  end

  class Configuration
      attr_reader :subscription_code
      attr_reader :file_type
      attr_reader :download_path

    def initialize
      path = File.expand_path find_config_file
      config = YAML.load(File.open(path))
      if config["subscription-code"].present? && config["subscription-code"].length >= 22
        @subscription_code = config["subscription-code"]
        Logger.info 'Subscription code is available.'
      else
        @subscription_code = 'free_user'
        Logger.info 'Subscription code is not available, only free episodes will be downloaded'
        Logger.info 'If you want to view the pro episodes, please buy a license'
      end
      @file_type = config["file-type"].present? ? config["file-type"] : 'mp4'
      if config["download-path"].present?
        @download_path = File.expand_path config["download-path"]
        Logger.info "Using download path: #{@download_path}"
      else
        @download_path = File.expand_path '~/railscasts'
        Logger.info "No download path found, using the default path: #{@download_path}"
      end
    end

    def find_config_file
      Logger.info 'Loading config file'
      if File.exist? File.expand_path('~/.railscasts.yml')
        path = '~/.railscasts.yml'
      else
        Logger.info 'No config file found on location: ~/.railscasts.yml'
        raise 'No File Found Error'
      end
    end
  end
end