Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  patch 'games/changeTurn', to: 'games#changeTurn'

  resources :roles
  resources :users
  resources :games

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
