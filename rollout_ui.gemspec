# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rollout_ui"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Allison"]
  s.date = "2013-02-15"
  s.description = "A UI for James Golick's rollout gem"
  s.email = "jrallison@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/rollout_ui.rb",
    "lib/rollout_ui/engine/.gitignore",
    "lib/rollout_ui/engine/Rakefile",
    "lib/rollout_ui/engine/app/controllers/rollout_ui/application_controller.rb",
    "lib/rollout_ui/engine/app/controllers/rollout_ui/features_controller.rb",
    "lib/rollout_ui/engine/app/helpers/rollout_ui/application_helper.rb",
    "lib/rollout_ui/engine/app/views/layouts/rollout_ui/application.html.erb",
    "lib/rollout_ui/engine/app/views/rollout_ui/features/_feature.html.erb",
    "lib/rollout_ui/engine/app/views/rollout_ui/features/index.html.erb",
    "lib/rollout_ui/engine/config/routes.rb",
    "lib/rollout_ui/engine/lib/rollout_ui/engine.rb",
    "lib/rollout_ui/engine/lib/tasks/rollout_ui_tasks.rake",
    "lib/rollout_ui/engine/script/rails",
    "lib/rollout_ui/feature.rb",
    "lib/rollout_ui/monkey_patch.rb",
    "lib/rollout_ui/server.rb",
    "lib/rollout_ui/server/public/rollout_ui/application.css",
    "lib/rollout_ui/server/public/rollout_ui/application.js",
    "lib/rollout_ui/server/public/rollout_ui/chosen-sprite.png",
    "lib/rollout_ui/server/public/rollout_ui/dark_brick_wall.png",
    "lib/rollout_ui/server/public/rollout_ui/rollout.png",
    "lib/rollout_ui/server/views/feature.erb",
    "lib/rollout_ui/server/views/index.erb",
    "lib/rollout_ui/server/views/layout.erb",
    "lib/rollout_ui/version.rb",
    "lib/rollout_ui/wrapper.rb",
    "rollout_ui.gemspec"
  ]
  s.homepage = "http://github.com/jrallison/rollout_ui"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A UI for James Golick's rollout gem"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rollout>, [">= 0"])
      s.add_runtime_dependency(%q<rollout_ui>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<uglifier>, [">= 0"])
      s.add_development_dependency(%q<mysql>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<redis-namespace>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rollout>, [">= 0"])
      s.add_dependency(%q<rollout_ui>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<uglifier>, [">= 0"])
      s.add_dependency(%q<mysql>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<redis-namespace>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rollout>, [">= 0"])
    s.add_dependency(%q<rollout_ui>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<uglifier>, [">= 0"])
    s.add_dependency(%q<mysql>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<redis-namespace>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

