require "drugbank/version"

require 'net/http'

require 'sax_stream/mapper'
require 'sax_stream/parser'

Dir["#{File.dirname(__FILE__)}/drugbank/*.rb"].each { |f| require(f) }

module Drugbank
end