require "spec_helper"

describe RolloutUI::Feature do
  describe ".add" do
    it "adds the feature to the active list" do
      RolloutUI::Feature.add(:feature1)
      RolloutUI::Feature.add(:feature2)

      RolloutUI::Feature.all.length.should == 2
      RolloutUI::Feature.all.include?("feature1").should be_true
      RolloutUI::Feature.all.include?("feature2").should be_true
    end

    it "doesn't add a given feature twice" do
      RolloutUI::Feature.add(:feature1)
      RolloutUI::Feature.add(:feature1)

      RolloutUI::Feature.all.should == ["feature1"]
    end
  end

  describe ".all" do
    it "returns empty array if no features have been requested" do
      RolloutUI::Feature.all.should == []
    end

    it "should return all features that have been requested" do
      rollout.active?(:feature1, mock(:user, :id => 5))
      rollout.active?(:feature2, mock(:user, :id => 5))

      RolloutUI::Feature.all.length.should == 2
      RolloutUI::Feature.all.include?("feature1").should be_true
      RolloutUI::Feature.all.include?("feature2").should be_true
    end
  end
end
