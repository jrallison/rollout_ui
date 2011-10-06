class Rollout
  alias_method :original_active?, :active?

  def active?(feature, user)
    RolloutUI::Feature.add(feature)
    original_active?(feature, user)
  end
end

class RolloutUI::Feature
  def self.all
    RolloutUI.redis.smembers(:features) || []
  end

  def self.add(feature)
    RolloutUI.redis.sadd(:features, feature)
  end

  def self.reset!
    RolloutUI.redis.del(:features)
  end
end
