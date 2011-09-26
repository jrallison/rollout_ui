require "spec_helper"

describe RolloutUI::Group do
  describe ".add" do
    it "adds the group to the list" do
      RolloutUI::Group.add(:group1)
      RolloutUI::Group.add(:group2)

      RolloutUI::Group.all.length.should == 2
      RolloutUI::Group.all.include?(:group1).should be_true
      RolloutUI::Group.all.include?(:group2).should be_true
    end

    it "doesn't add a given group twice" do
      RolloutUI::Group.add(:group1)
      RolloutUI::Group.add(:group1)

      RolloutUI::Group.all.should == [:group1]
    end
  end

  describe ".all" do
    it "should return all groups that have been defined" do
      rollout.define_group(:group1){ |user| true }
      rollout.define_group(:group2){ |user| true }

      RolloutUI::Group.all.length.should == 2
      RolloutUI::Group.all.include?(:group1).should be_true
      RolloutUI::Group.all.include?(:group2).should be_true
    end
  end
end
