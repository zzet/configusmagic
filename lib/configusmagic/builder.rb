module Configusmagic
  class Builder
    def initialize(block)
      @block = block
      @config = {}
    end

    def build
      instance_eval &@block
      @config
    end

    def method_missing(method, *args, &block)
      @config[method] = args.first
    end

    def env(environment, *args, &block)
      @config[environment] = Configusmagic::RecursiveBuilder.new block
    end
  end
end
