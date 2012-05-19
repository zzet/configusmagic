require  'active_support/core_ext/hash/deep_merge'

module Configusmagic
  class Builder
    def initialize(&block)
      @block = block
      @config = {}
    end

    def build
      instance_eval &@block
      @config
    end

    def env(environment, *args, &block)
      @config[environment] = Configusmagic::RecursiveBuilder.new(&block).build
      if args.first && args.first[:parent]
        @config[environment] = @config[args.first[:parent]].deep_merge @config[environment]
      end
    end
  end
end
