require "configusmagic/version"

module Configusmagic
  autoload :Builder, 'configusmagic/builder'
  autoload :RecursiveBuilder, 'configusmagic/recursive_builder'

  def self.build(environment, &block)
    config = Configusmagic::Builder.new block
    config.build
    config.get environment
  end
end
