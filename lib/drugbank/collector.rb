module Drugbank
  class Collector
    def initialize(batch_size, &block)
      @batch_size = batch_size
      @counter = 0
      @batch = []
      self.block = block
    end

    def <<(value)
      @batch << value
      @counter += 1
      collect_batch if @counter % @batch_size == 0
    end

    def collect_batch
      process_batch unless @batch.empty?
      @batch = []
      puts "  #{@counter}"
    end

    def block=(block)
      @block = block
    end

    def process_batch
      puts "Processing batch .."
      errors = []
      begin
        block.call(@batch, errors)
      rescue Exception => e
        errors << "Error: BATCH FAILED - #{e.message}"
      ensure
        puts errors.join("\n")
        puts "..done"
      end
    end

    private
    def block
      @block
    end
  end
end