# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pont_del_petroli/version'

Gem::Specification.new do |spec|
  spec.name          = "pont_del_petroli"
  spec.version       = PontDelPetroli::VERSION
  spec.authors       = ["Raul Galindo"]
  spec.email         = ["rgalindo33@hotmail.com"]
  spec.summary       = %q{Real time PontdelPetroli buoy information.}
  spec.description   = %q{Fetches the data from Badalonas buoy and gives it as a ruby object.}
  spec.homepage      = "http://rgalindo33.github.io/pont_del_petroli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"
end
