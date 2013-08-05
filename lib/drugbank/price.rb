require 'drugbank/base'
module Drugbank
  class Price < Drugbank::Base
    include SaxStream::Mapper
    map :description, :to => 'description'
    map :cost, :to => 'cost'
    map :currency, :to => 'cost@currency'
    map :unit, :to => 'unit'
  end
end