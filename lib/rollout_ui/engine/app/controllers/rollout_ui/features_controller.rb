module RolloutUi
  class FeaturesController < RolloutUi::ApplicationController
    before_filter :wrapper, :only => [:index]

    def index
      @features = @wrapper.features.map{ |feature| RolloutUi::Feature.new(feature) }
    end

    def update
      @feature = RolloutUi::Feature.new(params[:id])

      @feature.percentage = params["percentage"] if params["percentage"]
      @feature.groups     = params["groups"]     if params["groups"]
      @feature.user_names = params["user_names"] if params["user_names"]

      redirect_to features_path
    end

  private

    def wrapper
      @wrapper = RolloutUi::Wrapper.new
    end
  end
end
