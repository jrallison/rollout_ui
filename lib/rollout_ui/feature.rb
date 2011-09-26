class Rollout
  alias_method :original_active?, :active?

  def active?(feature, user)
    RolloutUI::Feature.add(feature)
    original_active?(feature, user)
  end
end

class RolloutUI::Feature
  @@features = {}

  def self.all
    @@features.keys
  end

  def self.add(feature)
    @@features[feature] = true
  end

  def self.reset!
    @@features = {}
  end
end
