module RolloutUi
  class Features::CurrentUsersController < ApplicationController
    before_filter :load_feature

    def create
      @feature.user_ids = @feature.user_ids + [current_user.id.to_s]
      redirect_to features_path
    end

    def destroy
      @feature.user_ids = @feature.user_ids - [current_user.id.to_s]
      redirect_to features_path
    end

  private

    def load_feature
      @feature = RolloutUi::Feature.new(params[:feature_id])
    end
  end
end
