# -*- encoding: utf-8 -*-
require File.expand_path('../lib/thinreports-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Takeshi Shinoda"]
  gem.email         = ["takeshinoda@gmail.com"]
  gem.description   = %q{Rails plugin for Thinreports DSL.}
  gem.summary       = %q{Rails plugin for Thinreports DSL.}
  gem.homepage      = "https://github.com/takeshinoda/thinreports-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "thinreports-rails"
  gem.require_paths = ["lib"]
  gem.version       = ThinreportsRails::VERSION
  gem.add_dependency "thinreports", '~>0.7.6'
end
