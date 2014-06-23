require 'spec_helper'

describe Rollout do
  describe "getting the active state" do
    before do
      @wrapper = $rollout.ui_wrapper
    end

    it "adds a feature if it doesn't exist yet" do
      @wrapper.should_receive(:feature_exists?).once.and_return(false)
      @wrapper.should_receive(:add_feature).once.with(:new_feature)

      $rollout.active?(:new_feature)
    end

    it "doesn't add a new feature if it already exists" do
      @wrapper.should_receive(:feature_exists?).once.and_return(true)
      @wrapper.should_receive(:add_feature).never

      $rollout.active?(:new_feature)
    end
  end
end
