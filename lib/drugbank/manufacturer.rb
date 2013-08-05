require 'drugbank/base'
module Drugbank
  class Manufacturer < Drugbank::Base
    include SaxStream::Mapper

    map :generic, :to => '@generic'
    map :name,    :to => ''
  end
end