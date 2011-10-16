require 'spec_helper'

describe RolloutUi::Wrapper do
  before do
    @rollout_ui = RolloutUi::Wrapper.new($rollout)
  end

  describe "#groups" do
    it "returns all groups defined for the rollout instance" do
      $rollout.define_group(:beta_testers) { |user| user.beta_tester? }

      @rollout_ui.groups.should == ["all", "beta_testers"]
    end

    it "doesn't return other defined groups" do
      Rollout.new($redis).define_group(:beta_testers) { |user| user.beta_tester? }

      @rollout_ui.groups.should == ["all"]
    end
  end

  describe "#features" do
    it "returns an empty array if no features have been requested" do
      @rollout_ui.features.should == []
    end

    it "returns all features that have been requested" do
      $rollout.active?(:featureA, mock(:user, :id => 5))
      $rollout.active?(:featureB, mock(:user, :id => 6))

      @rollout_ui.features.should == ["featureA", "featureB"]
    end

    it "lists each feature only once" do
      $rollout.active?(:featureA, mock(:user, :id => 5))
      $rollout.active?(:featureA, mock(:user, :id => 6))

      @rollout_ui.features.should == ["featureA"]
    end
  end

  describe "#add_feature" do
    it "adds feature to the list of features" do
      @rollout_ui.add_feature(:featureA)

      @rollout_ui.features.should == ["featureA"]
    end
  end
end
