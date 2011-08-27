require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new(:specs) do |test|
  test.libs << 'lib' << 'specs'
  test.pattern = 'specs/**/*_spec.rb'
  test.verbose = false
  test.warning = true
end

task :default => :specs
