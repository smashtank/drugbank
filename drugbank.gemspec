# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drugbank/version'

Gem::Specification.new do |gem|
  gem.name          = "drugbank"
  gem.version       = Drugbank::VERSION
  gem.authors       = ["Eric Harrison"]
  gem.email         = ["eharrison@smashtankapps.com"]
  gem.description   = %q{Download the xml from Drugbank.ca and import}
  gem.summary       = %q{Importer for Drugbank.ca}
  gem.homepage      = "http://github.com/smashtank/drugbank"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "sax_stream", "1.0.3"
  gem.add_dependency "rubyzip", "0.9.9"
end
