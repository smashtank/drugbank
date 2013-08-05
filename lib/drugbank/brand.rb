require 'drugbank/base'
module Drugbank
  class Brand < Drugbank::Base
    include SaxStream::Mapper
    node 'brand'
    map :name, :to => ''
  end
end