require 'drugbank/base'
module Drugbank
  class Synonym < Drugbank::Base
    include SaxStream::Mapper

    node 'synonym'
    map :name, :to => ''
  end
end