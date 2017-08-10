get '/users/:id', to: 'users#show'
patch '/users/:id', to: 'users#update'
root to: 'users#index'
resources :users, only: %i[create]
