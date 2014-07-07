RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :create, :update]

  root :to => "features#index"
end
