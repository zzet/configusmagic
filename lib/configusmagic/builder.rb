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

    def env(environment, *args, &block)
      @config[environment] = Configusmagic::RecursiveBuilder.build block
    end
  end
end
