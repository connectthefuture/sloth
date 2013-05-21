Sloth::Application.routes.draw do
  root to: "prototypes#index"

  resources :prototypes, only: [:index, :show]

  namespace :admin do
    root to: "prototypes#index"
    
    resources :prototypes, only: [:index, :edit, :create, :update, :destroy, :new] do
      resources :pages do
        resources :page_versions, only: [:new, :create, :index, :show] do
          resources :comments, only: [:create]
        end
        resources :links
      end
    end
  end

  resources :users
  match '/login', to: 'sessions#new', as: :login
  match '/auth/g/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'

end
