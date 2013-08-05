require 'drugbank/base'
module Drugbank
  class Packager < Drugbank::Base
    include SaxStream::Mapper
    map :name,  :to => 'name'
    map :url,        :to => 'url'
  end
end