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
      @config[environment] = {
          :config => Configusmagic::RecursiveBuilder.build(&block),
          :parent => (args.first && args.first[:parent]) ? args.first[:parent] : nil
      }
   end

   def get(environment)
     if @config[environment][:parent]
       parent = @config[environment][:parent]
       @config[environment][:config] = get(parent).deep_merge @config[environment][:config]
     end
     @config[environment][:config]
   end
  end
end
