class Rollout
  alias_method :original_active?, :active?

  def active?(feature, user=nil)
    RolloutUi::Wrapper.new(self).add_feature(feature) if RolloutUi.track_features
    original_active?(feature, user)
  end
end
