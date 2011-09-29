class Rollout
  alias_method :original_define_group, :define_group

  def define_group(group, &block)
    RolloutUI::Group.add(group)
    original_define_group(group, &block)
  end
end

class RolloutUI::Group
  def self.all
    RolloutUI.redis.smembers(:groups) << "all"
  end

  def self.add(group)
    RolloutUI.redis.sadd(:groups, group)
  end

  def self.reset!
    RolloutUI.redis.del(:groups)
  end
end
