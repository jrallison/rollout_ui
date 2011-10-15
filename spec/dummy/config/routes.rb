Rails.application.routes.draw do
  mount RolloutUI::Engine => "/rollout"

  root :to => proc { |env| [200, {}, "Hello World!"] }
end
