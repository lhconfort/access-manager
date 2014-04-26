# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'access_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "access_manager"
  spec.version       = AccessManager::VERSION
  spec.authors       = ["Matias Hick"]
  spec.email         = ["unformatt@gmail.com"]
  spec.description   = "Manage grants in your applications"
  spec.summary       = "Manage grants in your applications"
  spec.homepage      = "https://github.com/unformattmh/access_manager"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.md", "README.md", "CHANGELOG.md", "lib/**/*", "vendor/**/*"]
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
