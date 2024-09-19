# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diverter/version'

Gem::Specification.new do |spec|
  spec.name          = "diverter"
  spec.version       = Diverter::VERSION
  spec.authors       = ["Robin Stammer\n"]
  spec.email         = ["robin.stammer@posteo.de"]
  spec.summary       = %q{Lightweight tool for execution of Ruby code in a forked Ruby process}
  spec.description   = %q{Lightweight tool for execution of Ruby code in a forked Ruby process}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
