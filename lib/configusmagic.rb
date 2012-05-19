require 'configusmagic/version'
require 'active_support/core_ext/hash/deep_merge'

module Configusmagic
  autoload :Builder, 'configusmagic/builder'
  autoload :RecursiveBuilder, 'configusmagic/recursive_builder'
  autoload :Config, 'configusmagic/config'

  def self.build(environment, &block)
    builder = Configusmagic::Builder.new &block
    builder.build
    config = builder.get environment
    Configusmagic::Config.new config
  end
end
