require 'rubygems'
require 'redis'
require 'redis-namespace'

require "#{File.dirname(__FILE__)}/../lib/rollout_ui"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'rack/test'

$redis = Redis.new
$redis = Redis::Namespace.new('rollout_ui:test', :redis => $redis)

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include AppHelper

  config.before(:each) do
    RolloutUI::Feature.reset!

    keys = $redis.keys("*")
    $redis.del(*keys) unless keys.empty?
  end

  def rollout
    @rollout ||= Rollout.new($redis)
  end
end

