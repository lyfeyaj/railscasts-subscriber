module RailsCasts
  class Downloader
    attr_accessor :episodes
    
    def initialize
      check_episodes_yaml_file
      check_existed_episodes
    end
    
    def check_episodes_yaml_file
      if File.exist? './../../tmp/episodes.yml'
        episodes = YAML.load(File.open('./episodes.yml'))
        Logger.info 'episodes.yml loaded'
      else
        
      end
    end
    
    def check_existed_episodes
      if Dir.exist? RailsCasts.config.download_path
        names = episodes["episodes"].values.map do |item|
          item["name"]
        end
        names.each do |name|
          if File.exist? './railscasts/' + name
        end
      else
        Dir.mkdir RailsCasts.config.download_path
      end
      # if File.exist? 
    end
  end
end