require 'drugbank/base'
module Drugbank
  class Category < Drugbank::Base
    include SaxStream::Mapper
    node 'category'
    map :name, :to => ''
  end
end