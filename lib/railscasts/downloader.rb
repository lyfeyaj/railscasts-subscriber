module RailsCasts
  class Downloader
    attr_reader :episodes
    attr_reader :download_path
    attr_reader :file_type
    attr_reader :subscription_code
    
    BASE_DOWNLOAD_URI = 'http://media.railscasts.com/assets/'
    
    def initialize
      check_and_load_episodes_yaml_file
      @download_path = File.expand_path RailsCasts.config.download_path
      @file_type = RailsCasts.config.file_type
      @subscription_code = RailsCasts.config.subscription_code
    end
    
    def download
      check_existed_episodes
      
    end
    
    def check_and_load_episodes_yaml_file
      if File.exist? './../../tmp/episodes.yml'
        @episodes = YAML.load(File.open(File.expand_path './../../tmp/episodes.yml'))
        Logger.info 'Episodes.yml loaded'
      else
        `touch './../../tmp/episodes.yml'`
        Logger.info 'Not Found episodes.yml file, creating a new one'
      end
    end
    
    def check_existed_episodes
      create_download_path_if_not_exist
      episodes.map do |item|
        if !File.exist? download_to_file(item)
          download_file item
        end
      end
    end
    
    def download_file(file)
      Logger.info "Downloading #{file['name']}"
      `wget #{download_from_uri(file)} -O #{download_to_file(file)}`
      Logger.info "Downloaded #{file['name']}"
    end
    
    def create_download_path_if_not_exist
      if !Dir.exist? download_path
        paths = download_path.split('/').keep_if{|i| i != ''}
        full_path = '/'
        paths.each do |path|
          full_path = full_path + path + '/'
          if !Dir.exist? full_path
            Dir.mkdir full_path
          end
        end
      end
    end
    
    def download_from_uri(file)
      if file['type'] == 'Pro'
        BASE_DOWNLOAD_URI + 'subscriptions/' + subscription_code + '/videos/' + file['name'] + '.' + file_type
      else
        BASE_DOWNLOAD_URI + 'episodes/videos/' + file['name'] + '.' + file_type
      end
    end
    
    def download_to_file(file)
      download_path + '/' + file['name'] + '.' + file_type
    end

    def list
      episodes.each do |episode|
        if !File.exist? download_to_file(item)
          Logger.notice episode['name'] + " ... downloaded"
        else
          Logger.notice episode['name'] + " ... not downloaded"
        end
      end
      Logger.info ''
    end
    
  end
end