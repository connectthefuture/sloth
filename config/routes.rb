Sloth::Application.routes.draw do

  root to: "prototypes#index"
  
  resources :prototypes, only: [:index, :edit, :create, :update, :destroy, :new] do
    member do
      post :heart
    end
    resources :pages do
      member do
        post :heart
      end
      resources :page_versions, only: [:new, :create, :index, :show] do
        resources :comments, only: [:create]
      end
      resources :links
    end
  end

  resources :users
  match '/login', to: 'sessions#new', as: :login
  match '/auth/g/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'

end
