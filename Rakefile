#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./**/*_spec.rb"
end

task :default => :spec


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rollout_ui"
    gem.summary = %Q{A UI for James Golick's rollout gem}
    gem.description = %Q{A UI for James Golick's rollout gem}
    gem.email = "jrallison@gmail.com"
    gem.homepage = "http://github.com/jrallison/rollout_ui"
    gem.authors = ["John Allison"]
    gem.files.exclude 'spec/**/*'
    gem.files.exclude 'spec/**/.*'
    gem.files.exclude 'lib/rollout_ui/engine/app/assets/**/*'
    gem.files.exclude 'lib/rollout_ui/engine/app/assets/**/.*'
    gem.files.exclude 'lib/rollout_ui/engine/vendor/assets/**/*'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install   jeweler"
end
