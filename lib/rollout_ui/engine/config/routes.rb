RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :update, :destroy]

  root :to => "features#index"
end
