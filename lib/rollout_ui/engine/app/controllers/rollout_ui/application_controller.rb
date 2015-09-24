module RolloutUi
  class ApplicationController < ActionController::Base
    user, password = RolloutUi.config.rails_user, RolloutUi.config.rails_password
    if user && password
      http_basic_authenticate_with name: user, password: password
    end
  end
end
