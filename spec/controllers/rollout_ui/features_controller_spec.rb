require 'spec_helper'

describe RolloutUi::FeaturesController do
  let(:wrapper) { RolloutUi::Wrapper.new }

  describe '.create' do
    it 'creates a feature' do
      wrapper.features.should be_empty

      post :create, :name => 'featureA', :use_route => :rollout

      wrapper.features.should include 'featureA'
    end

    it 'creates a deactivated feature' do
      post :create, :feature => {:name => 'featureA' }, :use_route => :rollout

      feature = RolloutUi::Feature.new('featureA')
      feature.percentage.should == 0
      feature.groups.should be_empty
      feature.user_ids.should be_empty
    end

  end
end