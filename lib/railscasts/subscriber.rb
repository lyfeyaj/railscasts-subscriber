module RailsCasts
  class Subscriber
    def update
      episodes = Spider.new.multi_threads_scrap
      file = File.open('/tmp/episodes.yml', 'w')
      file.write(episodes.to_yaml)
      file.close
      Logger.info "RailsCasts Info Updated"
    end
  end
end
