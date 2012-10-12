# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumable/version'

Gem::Specification.new do |gem|
  gem.name          = "enumable"
  gem.version       = Enumable::VERSION
  gem.authors       = ["Brett Huneycutt"]
  gem.email         = ["brett@1000memories.com"]
  gem.description   = %q{Simple enum attributes for Active Record models}
  gem.summary       = %q{has_enumable_attribute is the main method}
  gem.homepage      = ""
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
