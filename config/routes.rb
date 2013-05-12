Sloth::Application.routes.draw do
  root :to => "prototypes#index"

  resources :prototypes do
    resources :pages do
      resources :links
    end
  end

  resources :users

  match '/login', :to => 'sessions#new', :as => :login
  match '/auth/g/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

end
