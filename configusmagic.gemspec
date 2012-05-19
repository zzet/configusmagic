# -*- encoding: utf-8 -*-
require File.expand_path('../lib/configusmagic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrey Kumanyaev", "Andrey Subbota"]
  gem.email         = ["me@zzet.org", "subbota@gmail.com"]
  gem.description   = %q{Configus magic}
  gem.summary       = %q{Summary to configus}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "configusmagic"
  gem.require_paths = ["lib"]
  gem.version       = Configusmagic::VERSION
end
