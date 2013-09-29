# -*- encoding: utf-8 -*-
require_relative 'lib/railscasts/kernel_helper'
require_relative 'lib/railscasts/logger'
require_relative 'lib/railscasts/version'

desc 'Install this gem into your system'
task :install do
  RailsCasts::Logger.info 'Preparing episodes.yml. Location: /tmp/episodes.yml'
  if !File.exist? '/tmp/episodes.yml'
    if system 'cp tmp/episodes.yml /tmp/episodes.yml'
      info = 'done!'
    else
      info = 'fail!'
    end
    RailsCasts::Logger.notice 'Copy episodes.yml to your system', info
  else
    RailsCasts::Logger.info 'Already Exist!'
  end
  RailsCasts::Logger.print

  RailsCasts::Logger.info 'Preparing .railscasts.yml. Location: ~/.railscasts.yml'
  if !File.exist? (File.expand_path '~/.railscasts.yml')
    if system 'cp config/railscasts.yml.example ~/.railscasts.yml'
      info = 'done!'
    else
      info = 'fail!'
    end
    RailsCasts::Logger.notice 'Copy railscasts.yml to your system', info
  else
    RailsCasts::Logger.info 'Already Exist!'
  end
  RailsCasts::Logger.print

  RailsCasts::Logger.info 'Building gem'
  system 'gem build railscasts.gemspec'

  RailsCasts::Logger.print
  RailsCasts::Logger.info 'Installing gem'
  system "gem install railscasts-#{RailsCasts::VERSION}.gem --no-ri --no-rdoc"
  RailsCasts::Logger.info
  RailsCasts::Logger.print 'Please set up your subscription code to enjoy ~~~ ^_^'
  RailsCasts::Logger.print
  RailsCasts::Logger.print 'Author: Felix Liu'
  RailsCasts::Logger.print
end
