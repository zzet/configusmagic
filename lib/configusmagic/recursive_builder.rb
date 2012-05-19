module Configusmagic
  class RecursiveBuilder
    def initialize(&block)
      @block = block
      @config = {}
    end

    def build
      instance_eval &@block
      @config
    end

    def method_missing(method, *args, &block)
      if block_given?
        @config[method] = self.class.new(&block).build
      else
        @config[method] = args.first
      end
    end

  end
end
