require 'drugbank/base'
module Drugbank
  class Group < Drugbank::Base
    include SaxStream::Mapper

    map :name, :to => ''
  end
end