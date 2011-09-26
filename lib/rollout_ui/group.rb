class Rollout
  alias_method :original_define_group, :define_group

  def define_group(group, &block)
    RolloutUI::Group.add(group)
    original_define_group(group, &block)
  end
end

class RolloutUI::Group
  @@groups = {}

  def self.all
    @@groups.keys
  end

  def self.add(group)
    @@groups[group] = true
  end

  def self.reset!
    @@groups = {}
  end
end
