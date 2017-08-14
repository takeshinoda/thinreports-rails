# -*- encoding: utf-8 -*-
require File.expand_path('../lib/thinreports-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Takeshi Shinoda"]
  gem.email         = ["takeshinoda@gmail.com"]
  gem.description   = %q{Rails plugin for ThinReports DSL. This plugin can write DSL to View.}
  gem.summary       = %q{Rails plugin for ThinReports DSL.}
  gem.homepage      = "https://github.com/takeshinoda/thinreports-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "thinreports-rails"
  gem.require_paths = ["lib"]
  gem.version       = ThinreportsRails::VERSION

  gem.add_runtime_dependency "thinreports", '>= 0.10'
  gem.add_development_dependency 'bundler', '>= 1.7'
end

