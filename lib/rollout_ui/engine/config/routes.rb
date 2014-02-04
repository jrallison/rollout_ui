RolloutUi::Engine.routes.draw do
  resources :features, :only => [:index, :update] do
    resource :current_user, :only => [:create, :destroy], :controller => 'features/current_users'
  end

  root :to => "features#index"
end
