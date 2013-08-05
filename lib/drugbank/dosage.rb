require 'drugbank/base'
module Drugbank
  class Dosage < Drugbank::Base
    include SaxStream::Mapper

    node 'dosage'

    map :form,     :to => 'form'
    map :route,    :to => 'route'
    map :strength, :to => 'strength'
  end
end