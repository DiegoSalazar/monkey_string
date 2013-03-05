# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monkey_string/version'

Gem::Specification.new do |gem|
  gem.name          = "monkey_string"
  gem.version       = MonkeyString::VERSION
  gem.authors       = ["Diego Salazar"]
  gem.email         = ["diego@greyrobot.com"]
  gem.description   = %q{Adds neat methods to String}
  gem.summary       = %q{Adds class and instance methods for random strings, alphanumeric introspection, and more.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
