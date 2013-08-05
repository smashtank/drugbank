require 'drugbank/base'
module Drugbank
  class Patent < Drugbank::Base
    include SaxStream::Mapper

    map :number,      :to => 'number'
    map :country,     :to => 'country'
    map :expires_at,  :to => 'expires'
    map :approved_at, :to => 'approved'
  end
end