require 'spec_helper'

describe RolloutUi::Feature do
  before do
    # Request a feature to prime RolloutUi::Wrapper rollout instance
    $rollout.active?(:featureA, mock(:user, :id => 5))

    @feature = RolloutUi::Feature.new(:featureA)
  end

  describe "#percentage" do
    it "returns the activated percentage for the feature" do
      $rollout.activate_percentage(:featureA, 75)
      @feature.percentage.should == "75"
    end
  end

  describe "#percentage=" do
    it "sets the activated percentage for the feature" do
      @feature.percentage = 90
      RolloutUi::Feature.new(:featureA).percentage.should == "90"
    end
  end

  describe "#groups" do
    it "returns the activated groups for the feature" do
      $rollout.activate_group(:featureA, :beta_testers)
      @feature.groups.should == ["beta_testers"]
    end
  end

  describe "#groups=" do
    it "sets the activated groups for the feature" do
      @feature.groups = ["all", "admins"]
      RolloutUi::Feature.new(:featureA).groups.should == ["admins", "all"]
    end
  end

  describe "#users" do
    it "returns the activated users for the feature" do
      $rollout.activate_user(:featureA, mock(:user, :id => 5))
      @feature.user_ids.should == ["5"]
    end
  end

  describe "#users=" do
    it "sets the activated users for the feature" do
      @feature.user_ids = [5, "7", ""]
      RolloutUi::Feature.new(:featureA).user_ids.length.should == 2
      RolloutUi::Feature.new(:featureA).user_ids.should include("5") 
      RolloutUi::Feature.new(:featureA).user_ids.should include("7") 
    end
  end
end
