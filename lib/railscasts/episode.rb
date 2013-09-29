module RailsCasts
  class Episode
    attr_accessor :id
    attr_accessor :type
    attr_accessor :name
    attr_accessor :published_at

    def initialize(episode)
      self.id = episode['id']
      self.type = episode['type']
      self.name = episode['name']
      self.published_at = episode['published_at']
    end

    def available?
       type == 'Normal' || RailsCasts.config.subscription_code != 'free_user'
    end

    def exist?
      File.exist? output_path
    end

    def output_path
      RailsCasts.config.download_path + '/' + fullname
    end

    def fullname
      [name, RailsCasts.config.file_type].join('.')
    end

    def uri
      path = 'http://media.railscasts.com/assets/'
      path = if type == 'Pro'
        path + 'subscriptions/' + RailsCasts.config.subscription_code
      else
        path + 'episodes'
      end
      path = path + '/videos/' + name + '.' + RailsCasts.config.file_type
    end
  end
end