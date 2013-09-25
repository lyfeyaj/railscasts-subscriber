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
      path = File.expand_path choose_path
      config = YAML.load(File.open(path))
      if config["subscription-code"].present?
        @subscription_code = config["subscription-code"]
        Logger.info 'OK'
      else
        Logger.info 'Subscription code is not existed'
        raise "Missing Subscription Code Error"
      end
      @file_type = config["file-type"].present? ? config["file-type"] : 'mp4'
      if config["download-path"].present?
        @download_path = config["download-path"]
        Logger.info 'OK'
      else
        Logger.info 'Download path is not existed'
        raise "Missing Download Path Error"
      end
    end
    
    def choose_path
      Logger.info 'Loading config file'
      if File.exist? File.expand_path('./../../config/railscasts.yml')
        path = './../../config/railscasts.yml'
      elsif File.exist? File.expand_path('~/.railscasts.yml')
        path = '~/.railscasts.yml'
      else
        Logger.info 'No config file found on location: ~/.railscasts.yml'
        raise 'No File Found Error'
      end
    end
  end
end