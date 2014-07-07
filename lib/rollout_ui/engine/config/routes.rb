RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :create, :update, :destroy]

  root :to => "features#index"
end
