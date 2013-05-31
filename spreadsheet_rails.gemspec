# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spreadsheet_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "spreadsheet_rails"
  spec.version       = SpreadsheetRails::VERSION
  spec.authors       = ["Jon Riddle"]
  spec.email         = ["coder@jdrnetworking.com"]
  spec.description   = %q{Use spreadsheet views in Rails 3}
  spec.summary       = %q{Use spreadsheet views in Rails 3}
  spec.homepage      = "https://github.com/jdrnetworking/spreadsheet_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/) - %w(.gitignore)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "spreadsheet"
  spec.add_runtime_dependency "rails", ">= 3.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
