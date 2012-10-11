# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rollout_ui/version"

Gem::Specification.new do |gem|
  gem.name          = "rollout_ui"
  gem.version       = RolloutUi::Version
  gem.authors       = ["John Allison"]
  gem.email         = ["jrallison@gmail.com"]
  gem.description   = %q{A UI for James Golick's rollout gem}
  gem.summary       = %q{A UI for James Golick's rollout gem}
  gem.homepage      = "http://github.com/jrallison/rollout_ui"

  gem.files         = Dir["lib/**/*"] + ["Rakefile", "README.markdown"]
  gem.test_files    = Dir["spec/**/*"]
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('rollout', '~> 1.1')

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rails')
  gem.add_development_dependency('sinatra')
  gem.add_development_dependency('uglifier')
  gem.add_development_dependency('mysql')
  gem.add_development_dependency('rspec-rails')
  gem.add_development_dependency('capybara')
  gem.add_development_dependency('launchy')
  gem.add_development_dependency('rack-test')
  gem.add_development_dependency('redis-namespace')
end
