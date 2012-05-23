module Configusmagic
  class Builder
    def initialize(&block)
      @block = block
      @config = {}
      @visited = []
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
     @visited = []
     get_env(environment)
   end

   def get_env(environment)
     @visited << environment
     if @config[environment][:parent]
       parent = @config[environment][:parent]
       if !@visited.include?(parent)
         @config[environment][:config] = get_env(parent).deep_merge @config[environment][:config]
       end
     end
     @config[environment][:config]
   end
  end
end
