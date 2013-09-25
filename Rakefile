  class Subscriber
    attr_reader :subscription_code
    attr_reader :log_info
    
    BASE_DOWNLOAD_URI = 'http://media.railscasts.com/assets/'
    
    def update
      
    end
    
    def update_all
      
    end
    
    def check_for_subscription_code
      Logger.info 'checking for subscription code'
      if File.exist? './subscription.yml'
        subscription = YAML.load(File.open('./subscription.yml'))
        if subscription["subscription_code"].present?
          @subscription_code = subscription["subscription_code"]
          Logger.info 'Ok'
        else
          Logger.info 'subscription code is not existed'
          raise "Missing Subscription Code Error"
        end
      else
        Logger.info 'No file found named: subscription.yml'
        raise 'No File Found Error'
      end
    end
    
    def check_for_new_episodes
      
    end
  end

  class Downloader
    attr_accessor :episodes
    
    def initialize
      check_episodes_yaml_file
      check_existed_episodes
    end
    
    def check_episodes_yaml_file
      if File.exist? './episodes.yml'
        episodes = YAML.load(File.open('./episodes.yml'))
        Logger.info 'episodes.yml loaded'
      else
        
      end
    end
    
    def check_existed_episodes
      if Dir.exist? './railscasts'
        names = episodes["episodes"].values.map do |item|
          item["name"]
        end
        names.each do |name|
          if File.exist? './railscasts/' + name
        end
      else
        Dir.mkdir './railscasts'
      end
      # if File.exist? 
    end
  end

end



namespace :episodes do
  desc 'Update and download new episodes'
  task :update do
    begin
      RailsCastsSubscriber.new.update
      RailsCastsDownloader.new.download
    rescue
      Logger.info 'There are some errors. Please check your files.'
    end
  end
  
  desc 'Update and download all episodes'
  task :update_all do
    RailsCastsDownloader.new.download
  end
  
  desc 'Download episodes'
  task :download do
    RailsCastsDownloader.new.download
  end
end