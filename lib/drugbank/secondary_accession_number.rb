require 'drugbank/base'
module Drugbank
  class SecondaryAccessionNumber < Drugbank::Base
    include SaxStream::Mapper
    node 'secondary-accession-number'

    map :number, :to => ''
  end
end