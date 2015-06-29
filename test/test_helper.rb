require "minitest/autorun"
require "minitest/pride"
require "vcr"
require "minitest-vcr"
require "dotenv"
require "webmock" # because faraday 0.9 and vcr 2.9.3 don't play nice together

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "bush_viper"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

MinitestVcr::Spec.configure!
Dotenv.load
