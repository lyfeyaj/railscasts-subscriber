# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "railscasts/version"

Gem::Specification.new do |s|
  s.name        = 'railscasts'
  s.version     = RailsCasts::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Felix Liu']
  s.email       = ['lyfeyaj@gmail.jp']
  s.homepage    = 'https://github.com/lyfeyaj/railscasts'
  s.summary     = 'A subscriber by hacking for railscasts via authorization token.'
  s.description = 'A subscriber by hacking for railscasts via authorization token.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ['README.md']
  s.require_paths = ['lib']

  s.licenses = ['MIT']

  s.add_dependency 'nokogiri'

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency 'pry', ['>= 0']
  s.add_development_dependency 'pry-nav', ['>= 0']
end