#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./**/*_spec.rb"
end

task :default => :spec

