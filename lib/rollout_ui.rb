require 'redis'
require 'rollout'
require 'rollout_ui/monkey_patch'

# Hack so we only load the engine when Rails will support it.
# TODO: find a better way
if defined?(Rails) && Rails::VERSION::STRING.to_f >= 3.1
  $:.unshift File.expand_path("rollout_ui/engine/lib", File.dirname(__FILE__))
  require 'rollout_ui/engine'
end

module RolloutUi
  autoload :Version, 'rollout_ui/version'
  autoload :Wrapper, 'rollout_ui/wrapper'
  autoload :Feature, 'rollout_ui/feature'
  autoload :Server,  'rollout_ui/server'

  def self.wrap(rollout)
    @@rollout = rollout
  end

  def self.rollout
    @@rollout
  end
end
