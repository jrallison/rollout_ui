class RolloutUI::Group
  def self.all
    (RolloutUI.redis.smembers(:groups) || []) << "all"
  end

  def self.add(group)
    RolloutUI.redis.sadd(:groups, group)
  end

  def self.reset!
    RolloutUI.redis.del(:groups)
  end
end
