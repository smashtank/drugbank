# Drugbank

Simple Gem (for now) that allows you to import the drugbank.ca xml

## Installation

Add this line to your application's Gemfile:

    gem 'drugbank'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install drugbank

## Usage

importer = Drugbank::Import.new('http://www.drugbank.ca/system/downloads/current/drugbank.xml.zip')
importer.import(){|drugs|  #do something }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
