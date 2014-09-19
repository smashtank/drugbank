require 'drugbank/base'
module Drugbank
  class DrugInteraction < Drugbank::Base
    include SaxStream::Mapper

    node 'drug-interaction'
    map :interaction_drug_id, :to => 'drugbank-id'
    map :name,                :to => 'name'
    map :description,         :to => 'description'
  end
end
