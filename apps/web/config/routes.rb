root to: 'users#index'
resources :users, only: %i[create]
