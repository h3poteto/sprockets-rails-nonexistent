# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets/rails/nonexistent/version'

Gem::Specification.new do |spec|
  spec.name          = "sprockets-rails-nonexistent"
  spec.version       = Sprockets::Rails::Nonexistent::VERSION
  spec.authors       = ["h3poteto"]
  spec.email         = ["h3.poteto@gmail.com"]
  spec.summary       = %q{raise error when assets cannot found through sprockets.}
  spec.description   = %q{raise error when assets cannot found through sprockets}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "sprockets-rails"
end