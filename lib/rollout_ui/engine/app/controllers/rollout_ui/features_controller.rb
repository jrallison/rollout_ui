module RolloutUi
  class FeaturesController < ApplicationController
    before_filter :wrapper

    def index
      @features = @wrapper.features.map{ |feature| RolloutUi::Feature.new(feature) }
    end

    def update
      @feature = RolloutUi::Feature.new(params[:id])

      @feature.percentage = params["percentage"] if params["percentage"] && params["percentage"].to_i > 0
      @feature.groups     = params["groups"]     if params["groups"]
      @feature.user_ids   = params["users"]      if params["users"]

      redirect_to features_path
    end

  private

    def wrapper
      @wrapper = RolloutUi::Wrapper.new
    end
  end
end
