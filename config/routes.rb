Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  patch 'games/changeTurn', to: 'games#changeTurn'

  patch 'games/robber', to: 'games#robber'

  patch 'games/trouble', to: 'games#trouble'

  patch 'games/vote', to: 'games#vote'

  get 'users/won', to: 'users#won'

  get '/seperate', to: 'games#seperate'

  resources :roles
  resources :users
  resources :games

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
