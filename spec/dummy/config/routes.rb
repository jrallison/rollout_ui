Rails.application.routes.draw do
  mount RolloutUi::Engine => "/rollout", :as => 'rollout'

  root :to => proc { |env| [200, {}, "Hello World!"] }
end
