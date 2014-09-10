# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scaffold_sinatra/version'

Gem::Specification.new do |spec|
  spec.name          = "scaffold_sinatra"
  spec.version       = ScaffoldSinatra::VERSION
  spec.authors       = ["h4w5"]
  spec.email         = ["philip@h4w5.com"]
  spec.summary       = %q{Helps scaffold a simple Sinatra app according to the WDI conventions.}
  spec.description   = %q{Helps scaffold a simple Sinatra app according to the WDI conventions.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.bindir        = "bin"
  spec.executables.push *["scaffold_sinatra"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake",    "~> 10.2"
  spec.add_development_dependency "pry",     "~> 0.9",  ">= 0.9.12"

  spec.add_runtime_dependency "colorize",    ">= 0.0"
end
