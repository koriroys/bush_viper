require "bundler/gem_tasks"
require "rake/testtask"

dir = File.dirname(__FILE__)

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "lib" << "test"
  t.test_files = Dir.glob("#{dir}/test/**/*_test.rb")
  t.warning = true
  t.verbose = true
end

namespace :test do
  desc "Clear all test VCR recordings"
  task :eject do
    system "rm -rf test/cassettes"
  end
end
