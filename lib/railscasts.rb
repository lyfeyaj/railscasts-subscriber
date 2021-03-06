#encoding: utf-8
require 'yaml'
require 'nokogiri'
require 'open-uri'

module RailsCasts
end

# Load railscasts components
require 'railscasts/kernel_helper'
require 'railscasts/logger'
require 'railscasts/config'
require 'railscasts/spider'
require 'railscasts/episode'
require 'railscasts/subscriber'
require 'railscasts/downloader'
require 'railscasts/version'
require 'railscasts/cli'
