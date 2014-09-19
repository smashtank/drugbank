require 'drugbank/base'
require 'drugbank/drug'

module Drugbank
  class Drugs < Drugbank::Base
    include SaxStream::Mapper
    node 'drugbank', :collect => false

    relate :drugs, :to => 'drug',  :as => [Drugbank::Drug]
  end
end

