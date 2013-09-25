module RailsCasts
  class Subscriber
    
    def update
      check_for_new_episodes
    end
    
    def update_all
      update
    end
    
    def check_for_new_episodes
      episodes = RailsCasts::Spider.new.scrap
      file = File.open('./../../tmp/episodes.yml', 'w')
      file.write(episodes.to_yaml)
      file.close
      Logger.info "RailsCasts Updated"
    end
    
  end
end