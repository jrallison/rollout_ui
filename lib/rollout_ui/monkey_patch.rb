class Rollout
  alias_method :original_active?, :active?

  def active?(feature, user=nil)
    ui_wrapper.add_feature(feature) unless ui_wrapper.feature_exists?(feature)
    original_active?(feature, user)
  end

  def ui_wrapper
    @_wrapper ||= RolloutUi::Wrapper.new(self)
  end
end
