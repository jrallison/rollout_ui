RolloutUI::Engine.routes.draw do
  root :to => proc { |env| [200, {}, "Rollout!"] }
end
