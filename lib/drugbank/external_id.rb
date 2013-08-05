require 'drugbank/base'
module Drugbank
  class ExternalId < Drugbank::Base
    include SaxStream::Mapper

    map :resource,  :to => 'resource'
    map :id,        :to => 'identifier'
  end
end