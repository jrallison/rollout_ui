class Rollout
  alias_method :original_define_group, :define_group

  def define_group(group, &block)
    RolloutUI::Group.add(group)
    original_define_group(group, &block)
  end

  alias_method :original_active?, :active?

  def active?(feature, user)
    RolloutUI::Feature.add(feature)
    original_active?(feature, user)
  end
end
