# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-git-history/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-git-history"
  spec.version       = Jekyll::GitHistory::VERSION
  spec.authors       = ["fukata"]
  spec.email         = ["tatsuya.fukata@gmail.com"]

  spec.summary       = %q{jekyll plugin to generate html snippets for git histories}
  spec.description   = %q{jekyll plugin to generate html snippets for git histories}
  spec.homepage      = "https://github.com/fukata/jekyll-git-history"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'jekyll', '>= 3.8'
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
end
