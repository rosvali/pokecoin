Rails.application.routes.draw do
  root 'pages#home'
  resources :pokemons, only: [:index, :show, :update]
  get 'pokemon/:id/checkout', to: 'pokemons#checkout', as: :pokemon_checkout
  post 'pokemon/:id/buy', to: 'pokemons#buy', as: :pokemon_buy
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show, :update]
end
