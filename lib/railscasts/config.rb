module RailsCasts
  # Global settings for Kaminari
  def self.config
    @config ||= Configuration.new
  end
  
  class Configuration
      attr_reader :subscription_code
      attr_reader :file_type
    
    def initialize
      Logger.info 'loading config file'
      path = './../../config/railscasts.yml'
      if File.exist? path
        config = YAML.load(File.open(path))
        if config["subscription-code"].present?
          @subscription_code = config["subscription-code"]
          Logger.info 'Ok'
        else
          Logger.info 'subscription code is not existed'
          raise "Missing Subscription Code Error"
        end
        @file_type = config["file-type"].present? ? config["file-type"] : 'mp4'
        if config["download-path"].present?
          @download_path = config["download-path"]
          Logger.info 'Ok'
        else
          Logger.info 'download path is not existed'
          raise "Missing Download Path Error"
        end
      else
        Logger.info 'No config file found on location: config/railscasts.yml'
        raise 'No File Found Error'
      end
    end
  end
end