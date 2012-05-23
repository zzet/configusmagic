module Configusmagic
  class Config
    def initialize(config)
      @hash = config
      config.each do |key, value|
        self.class.__send__(:attr_accessor, key.to_s)
        if value.kind_of? Hash
          value = self.class.new value
        end
        self.__send__("#{key.to_s}=", value)
      end
    end

    def to_hash
      @return = {}
      @hash.each do |key, value|
        @return[key] = (value.kind_of? Hash) ? value.to_hash : value
      end
      @return
    end
  end
end
