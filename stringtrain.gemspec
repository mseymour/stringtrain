# -*- encoding: utf-8 -*-
require File.expand_path('../lib/stringtrain/version', __FILE__)

Gem::Specification.new do |gem|
  gem "active_support"

  gem.authors       = ["Mark Seymour"]
  gem.email         = ["mark.seymour.ns@gmail.com"]
  gem.description   = %q{A handly DSL for creating conditionally formatted strings.}
  gem.summary       = %q{A cleaner way of making dynamically generated strings with conditions.}
  gem.homepage      = "https://github.com/mseymour/stringtrain"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "stringtrain"
  gem.require_paths = ["lib"]
  gem.version       = Stringtrain::VERSION
end
