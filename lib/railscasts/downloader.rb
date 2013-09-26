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
      create_download_path_if_not_exist
      episodes.map{ |episode| download_file episode if !episode_exist? episode }
    end
    
    def check_and_load_episodes_yaml_file
      if File.exist? '/tmp/episodes.yml'
        @episodes = YAML.load(File.open('/tmp/episodes.yml'))
        Logger.info 'Episodes.yml loaded'
      else
        `touch '/tmp/episodes.yml'`
        Logger.info 'Not Found episodes.yml file, creating a new one'
      end
    end
    
    def episode_exist?(episode)
      File.exist? download_to_file(episode)
    end
    
    def download_file(file)
      Logger.info "Start Downloading #{filename(file)}"
      `wget #{download_from_uri(file)} -O #{download_to_file(file)}`
      Logger.info "#{filename(file)} Downloaded"
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
      Logger.info "Your Download Path is: #{download_path}"
    end
    
    def download_from_uri(file)
      if file['type'] == 'Pro'
        BASE_DOWNLOAD_URI + 'subscriptions/' + subscription_code + '/videos/' + file['name'] + '.' + file_type
      else
        BASE_DOWNLOAD_URI + 'episodes/videos/' + file['name'] + '.' + file_type
      end
    end
    
    def download_to_file(file)
      download_path + '/' + filename(file)
    end
    
    def filename(file)
      file['name'] + '.' + file_type
    end

    def list
      download_counter = {yes: 0, no: 0}
      episodes.each do |episode|
        if episode_exist? episode
          download_counter[:yes] += 1
          Logger.notice filename(episode), "downloaded"
        else
          download_counter[:no] += 1
          Logger.notice filename(episode), "not downloaded"
        end
      end
      Logger.info
      Logger.info "#{download_counter[:yes]} episodes downloaded & #{download_counter[:no]} episodes not downloaded"
    end
    
  end
end