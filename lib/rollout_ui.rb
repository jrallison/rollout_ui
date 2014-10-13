require 'redis'
require 'rollout'
require 'rollout_ui/monkey_patch'

if defined?(Rails) && Rails::VERSION::STRING.to_f >= 3.1
  # Hack so that if the Engine is ever required, it's
  # able to find it's assets, etc. TODO: find a better way
  $:.unshift File.expand_path("rollout_ui/engine/lib", File.dirname(__FILE__))
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

  def self.track_features=(value)
    @@track_features = value
  end

  def self.track_features
    @@track_features
  end
  self.track_features = true

end
