RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :update]

  root :to => "features#index"
end
