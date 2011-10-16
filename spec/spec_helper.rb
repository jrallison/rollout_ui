ENV["RAILS_ENV"] ||= "test"

require 'rubygems'
require 'redis'
require 'redis-namespace'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

$redis = Redis::Namespace.new('rollout_ui:test', :redis => Redis.new)

RSpec.configure do |config|
  config.before(:each) do
    keys = $redis.keys("*")
    $redis.del(*keys) unless keys.empty?

    $rollout = Rollout.new($redis)
    RolloutUi.wrap($rollout)
  end
end
