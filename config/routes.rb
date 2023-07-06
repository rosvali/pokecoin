Rails.application.routes.draw do
  root 'pages#home'
  resources :pokemons, only: [:index, :show, :update]
  get 'pokemon/:id/checkout', to: 'pokemons#checkout', as: :pokemon_checkout
  post 'pokemon/:id/buy', to: 'pokemons#buy', as: :pokemon_buy
  # post 'pokemon/:id/sell', to: 'pokemons#sell', as: :pokemon_sell
  # get 'me', to: 'users#show', as: :user
  # get 'me/add', to: 'users#edit', as: :user_edit
  # patch 'me/add', to: 'users#update', as: :user_update
  # get 'me/transactions', to: 'users#transactions', as: :user_transactions
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show, :update]
end
