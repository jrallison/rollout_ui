require 'redis'
require 'rollout'
require 'rollout_ui/monkey_patch'

# TODO: load the rails 3.1 mountable engine only on demand
$:.unshift File.expand_path("rollout_ui/engine/lib", File.dirname(__FILE__))
require 'rollout_ui/engine'

module RolloutUI
  autoload :Version, 'rollout_ui/version'
  autoload :Wrapper, 'rollout_ui/wrapper'
  autoload :Server,  'rollout_ui/server'
end
