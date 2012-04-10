require 'spec_helper'

describe RolloutUi::FeaturesController do
  let(:wrapper) { RolloutUi::Wrapper.new }

  context 'Engine' do
    describe '#create' do
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

      it 'redirects to the list of features' do
        post :create, :feature => {:name => 'featureA' }, :use_route => :rollout

        response.should redirect_to(features_path)
      end
    end
  end

  describe 'Sinatra' do
    require File.expand_path('../../../../lib/rollout_ui/server', __FILE__)
    include Rack::Test::Methods

    def app
      RolloutUi::Server
    end

    describe '#create' do
      it 'creates a feature' do
        wrapper.features.should be_empty

        post '/features', :name => 'featureA'

        wrapper.features.should include 'featureA'
      end

      it 'creates a deactivated feature' do
        post '/features', :name => 'featureA'

        feature = RolloutUi::Feature.new('featureA')
        feature.percentage.should == 0
        feature.groups.should be_empty
        feature.user_ids.should be_empty
      end

      it 'redirects to the list of features' do
        post '/features', :name => 'featureA'
        last_response.should be_redirect
        follow_redirect!
        last_request.path.should == '/'
      end

    end
  end
end