RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :update, :create]

  root :to => "features#index"
end
