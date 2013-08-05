require 'zip/zip'
require 'net/http'
require 'open-uri' #incase we can
require 'uri'
require 'tempfile'
require 'digest/md5'
require 'zip/zip'

require 'drugbank/drugs'
require 'drugbank/collector'

module Drugbank
  class Import
    include ObjectSpace

    def initialize(url, batch_size = 500)
      @batch_size = batch_size
      @url = url
    end

    def parser
      @parser ||= SaxStream::Parser.new(collector, [Drugbank::Drugs])
    end

    def collector
      @collector ||= Drugbank::Collector.new(@batch_size)
    end

    def import(&block)
      set_collector_block(block)
      parser.parse_stream(fetch_url(@url))
      collector.collect_batch
    end

    private 
      def set_collector_block(block)
        collector.block = block
      end

      def add_file_for_cleanup(file)
        define_finalizer(self, lambda{|id| file.respond_to?(:unlink) ? file.unlink : File.unlink(file) })
      end

      def file_name
        "drugbank_import-#{Digest::MD5.hexdigest(@url)}.zip"
      end

      def fetch_url(url)
        case url.split(/\./).last
        when 'zip'
          zip_file = open(file_name, 'wb')
          add_file_for_cleanup(file_name)
          begin
            uri = URI.parse(url)
            Net::HTTP.start(uri.host, uri.port) do |http|
              http.request_get(uri.request_uri) do |resp|
                  resp.read_body do |segment|
                      zip_file.write(segment)
                  end
              end
            end
          ensure
            zip_file.close()
          end
          #unzip the file first
          Zip::ZipInputStream::open(file_name) do |io|    
            while (entry = io.get_next_entry)
              if entry.name.split(/\./).last == 'xml'
                unziped_file = Tempfile.new(Digest::MD5.hexdigest(entry.name))
                add_file_for_cleanup(unziped_file)
                unziped_file.write(io.read)
                unziped_file.close()
                return open(unziped_file.path)
              end
            end
          end
        else
          return open(url)
        end
    end
  end
end