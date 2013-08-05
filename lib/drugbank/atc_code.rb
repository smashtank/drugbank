require 'drugbank/base'

module Drugbank
  class AtcCode < Drugbank::Base
    include SaxStream::Mapper
    node 'atc-code'
    map :code, :to => ''
  end
end