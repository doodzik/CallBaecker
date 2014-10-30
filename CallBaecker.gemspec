# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'CallBaecker/version'

Gem::Specification.new do |spec|
  spec.name          = "CallBaecker"
  spec.version       = CallBaecker::VERSION
  spec.authors       = ["doodzik"]
  spec.email         = ["4004blog@gmail.com"]
  spec.summary       = %q{Intercepts method calls inorder to save arguments and to allow to terminate function from within a nested method}
  spec.homepage      = "https://github.com/doodzik/CallBaecker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
