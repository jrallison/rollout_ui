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
