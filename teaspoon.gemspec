# -*- encoding: utf-8 -*-
require File.expand_path('../lib/teaspoon/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andy Appleton"]
  gem.email         = ['andrew@mintdigital.com']
  gem.description   = %q{Send notifications to Mint Source}
  gem.summary       = %q{Send notifications to Mint Source http://github.com/mintdigital.com/mint-source}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "teaspoon"
  gem.require_paths = ["lib"]
  gem.version       = Teaspoon::VERSION

  gem.add_dependency 'json'
end
