require 'redis'
require 'rollout'

module RolloutUI
  autoload :Version, "rollout_ui/version"
  autoload :Feature, "rollout_ui/feature"
  autoload :Group,   "rollout_ui/group"
  autoload :Server,  "rollout_ui/server"

  def self.redis=(redis)
    @@redis = redis
  end
  def self.redis
    @@redis
  end
end
