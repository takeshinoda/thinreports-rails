# -*- encoding: utf-8 -*-
require File.expand_path('../lib/thinreports-handler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Takeshi Shinoda"]
  gem.email         = ["takeshinoda@gmail.com"]
  gem.description   = %q{Rails Template handler for Thinreports DSL.}
  gem.summary       = %q{Rails Template handler for Thinreports DSL.}
  gem.homepage      = "https://github.com/takeshinoda/thinreports-handler"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "thinreports-handler"
  gem.require_paths = ["lib"]
  gem.version       = ThinreportsHandler::VERSION
  gem.add_dependency "thinreports", '~>0.7.0'
end
