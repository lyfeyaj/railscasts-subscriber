module RailsCasts
  class Downloader
    attr_reader :episodes

    BASE_DOWNLOAD_URI = 'http://media.railscasts.com/assets/'

    def initialize
      check_and_load_episodes_yaml_file
    end

    def download
      create_download_path_if_not_exist
      episodes.map{ |episode| download_file episode if !episode.exist? && episode.available? }
      Logger.info 'All episodes have been downloaded!'
    end

    def check_and_load_episodes_yaml_file
      if File.exist? '/tmp/episodes.yml'
        @episodes = YAML.load(File.open('/tmp/episodes.yml')).map{|episode| Episode.new episode}
        # Logger.info 'Episodes.yml loaded'
      else
        `touch '/tmp/episodes.yml'`
        Logger.info 'Not Found episodes.yml file, creating a new one'
      end
    end

    def download_file(episode)
      Logger.info "Start Downloading #{episode.fullname}"
      Logger.print "Saving to: '#{episode.output_path}'"
      `curl -# -o #{episode.output_path} #{episode.uri}`
      Logger.print ""
      Logger.info "#{episode.fullname} Downloaded"
    end

    def create_download_path_if_not_exist
      download_path = RailsCasts.config.download_path
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

    def list
      download_counter = { yes: 0, no: 0 }
      episodes.each do |episode|
        if episode.exist?
          download_counter[:yes] += 1
          Logger.notice episode.fullname, "downloaded"
        else
          download_counter[:no] += 1
          Logger.notice episode.fullname, "not downloaded"
        end
      end
      Logger.info
      Logger.info "#{download_counter[:yes]} episodes downloaded & #{download_counter[:no]} episodes not downloaded"
    end

    def links
      Logger.info "List all the railscasts download links"
      counter = 0
      episodes.each do |episode|
        if episode.available?
          Logger.print episode.uri
          counter += 1
        end
      end
      Logger.print
      Logger.info "#{counter} railscasts have been listed!"
    end
  end
end