# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bush_viper/version"

Gem::Specification.new do |spec|
  spec.name          = "bush_viper"
  spec.version       = BushViper::VERSION
  spec.authors       = ["Kori Roys"]
  spec.email         = ["kori@koriroys.com"]
  spec.summary       = %q{Ruby wrapper for Mendeley API}
  spec.description   = %q{Ruby wrapper for Mendeley API with a really cool name}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "multi_json", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-vcr"
  spec.add_development_dependency "webmock"
end
