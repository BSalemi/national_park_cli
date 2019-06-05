require "national_park_cli/version"
require "open-uri"
require "nokogiri"

require_relative "park.rb"
require_relative "scraper.rb"
require_relative "state.rb"
require_relative "cli.rb"


module NationalParkCli
  class Error < StandardError; end
  # Your code goes here...
end
