require 'drugbank/base'
require 'drugbank/secondary_accession_number'
require 'drugbank/group'
require 'drugbank/brand'
require 'drugbank/synonym'
require 'drugbank/packager'
require 'drugbank/manufacturer'
require 'drugbank/price'
require 'drugbank/category'
require 'drugbank/dosage'
require 'drugbank/atc_code'
require 'drugbank/patent'
require 'drugbank/drug_interaction'
require 'drugbank/external_id'
require 'drugbank/external_link'

module Drugbank
  class Drug < Drugbank::Base
    include SaxStream::Mapper

    node 'drug'
    map :id,                     :to => 'drugbank-id'
    map :type,                   :to => '@type'
    map :name,                   :to => 'name'
    map :description,            :to => 'description'
    map :cas_registry_number,    :to => 'cas-number'
    map :general_references,     :to => 'general-references'
    map :synthesis_references,   :to => 'synthesis-references'
    map :indication,             :to => 'indication'
    map :pharmacology,           :to => 'pharmacology'
    map :mechanism_of_action,    :to => 'mechanism-of-action'
    map :toxicity,               :to => 'toxicity'
    map :biotransformation,      :to => 'biotransformation'
    map :absorption,             :to => 'absorption'
    map :half_life,              :to => 'half-life'
    map :protein_binding,        :to => 'protein-binding'
    map :route_of_elimination,   :to => 'route-of-elimination'
    map :volume_of_distribution, :to => 'volume-of-distribution'
    map :clearance,              :to => 'clearance'

    relate :secondary_accession_numbers, :to => 'secondary-accession-numbers/secondary_accession_number', :as => [Drugbank::SecondaryAccessionNumber], :parent_collects => true
    relate :brands,             :to => 'brands/brand',                              :as => [Drugbank::Brand],           :parent_collects => true
    relate :groups,             :to => 'groups/group',                              :as => [Drugbank::Group],           :parent_collects => true
    relate :synonyms,           :to => 'synonyms/synonym',                          :as => [Drugbank::Synonym],         :parent_collects => true
    relate :packagers,          :to => 'packagers/packager',                        :as => [Drugbank::Packager],        :parent_collects => true
    relate :manufacturers,      :to => 'manufacturers/manufacturer',                :as => [Drugbank::Manufacturer],    :parent_collects => true
    relate :prices,             :to => 'prices/price',                              :as => [Drugbank::Price],           :parent_collects => true
    relate :categories,         :to => 'categories/category',                       :as => [Drugbank::Category],        :parent_collects => true
    relate :dosages,            :to => 'dosages/dosage',                            :as => [Drugbank::Dosage],          :parent_collects => true
    relate :atc_codes,          :to => 'atc-codes/atc-code',                        :as => [Drugbank::AtcCode],         :parent_collects => true
    relate :patents,            :to => 'patents/patent',                            :as => [Drugbank::Patent],          :parent_collects => true
    relate :drug_interactions,  :to => 'drug-interactions/drug-interaction',        :as => [Drugbank::DrugInteraction], :parent_collects => true
    relate :external_ids,       :to => 'external-identifiers/external-identifier',  :as => [Drugbank::ExternalId],      :parent_collects => true
    relate :external_links,     :to => 'external-links/external-link',              :as => [Drugbank::ExternalLink],    :parent_collects => true
    
  end
end