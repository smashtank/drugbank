require 'drugbank/base'
module Drugbank
  class ExternalLink < Drugbank::Base
    include SaxStream::Mapper
    map :resource,  :to => 'resource'
    map :url,        :to => 'url'
  end
end