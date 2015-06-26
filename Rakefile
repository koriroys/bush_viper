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
