require "configusmagic/version"

module Configusmagic
  autoload :Builder, 'configusmagic/builder'
  autoload :RecursiveBuilder, 'configusmagic/recursive_builder'

  def self.build(&block)
    config = Configusmagic::Builder.new block
    config.build
  end
end
