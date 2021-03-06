require 'os'

module RailsCasts
  module Cli
    def self.run!
      begin
        opt = ARGV.first
        help = <<-HELP
  rcs update                # Update the newest episodes
  rcs upgrade               # Update the newest episodes and download
  rcs download              # Download all the episodes
  rcs list                  # List all the available episodes
  rcs info                  # Information about railscasts
  rcs links                 # List all the railscasts download links
  rcs open                  # Open the RailsCasts directory with default browser
  rcs -h/--help/help        # Output the help doc
  rcs -v/--version/version  # Output the version info
  HELP
        case opt
        when 'update'
          RailsCasts::Subscriber.new.update
        when 'upgrade'
          RailsCasts::Subscriber.new.update
          RailsCasts::Downloader.new.download
        when 'download'
          RailsCasts::Downloader.new.download
        when 'list'
          RailsCasts::Downloader.new.list
        when 'info'
          puts <<-INFO

  About RailsCasts

  RailsCasts is produced by Ryan Bates (rbates on Twitter and ryanb on GitHub).
  A free episode will be released on the first Monday of each month featuring
  tips and tricks with Ruby on Rails. The screencasts are short and focus on
  one technique so you can quickly move on to applying it to your own project.
  The topics target the intermediate Rails developer, but beginners and experts
  will get something out of it as well. A Pro option is also available containing
  more screencasts each week.

  Contact

  If you have any comments, suggestions, questions, etc. I'd love to hear them!
  Please use the Feedback Page or send an email to feedback@railscasts.com.

  INFO
        when 'links'
          RailsCasts::Downloader.new.links
        when 'open'
          browser = if OS.mac?
            'open'
          elsif OS.windows?
            'start'
          elsif OS.linux?
            'naulitus'
          end
          system "#{browser} #{RailsCasts.config.download_path}"
        when '-h', '--help', 'help'
          puts help
        when '-v', '--version', 'version'
          puts RailsCasts::VERSION
        else
          puts "No such command provided: #{opt}"
          puts help
        end
      rescue
        RailsCasts::Logger.info 'There are something wrong.'
        RailsCasts::Logger.info 'It may due to your net work environment or episodes.yml is not properly built'
        RailsCasts::Logger.info 'Please try to run command: railscasts update'
      end
    end
  end
end
