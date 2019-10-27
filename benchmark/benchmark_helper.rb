require 'bundler'
Bundler.require:default, (ENV["RACK_ENV"] || "development").to_sym

require 'benchmark'
require 'benchmark/ips'

require_relative '../lib/kompressor'

EBOOK = File.expand_path(File.join(__dir__, "../test_assets/jekyll_hyde.txt"))
