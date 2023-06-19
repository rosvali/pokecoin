Rails.application.routes.draw do
  root 'pages#home'
  resources :pokemons, only: [:index]
  get 'pokemon/:id', to: 'pokemons#show', as: :pokemon
  get 'pokemon/:id/checkout', to: 'pokemons#checkout', as: :pokemon_checkout
  post 'pokemon/:id/buy', to: 'pokemons#buy', as: :pokemon_buy
  post 'pokemon/:id/sell', to: 'pokemons#sell', as: :pokemon_sell
  get 'me', to: 'users#show', as: :user
  get 'me/add', to: 'users#edit', as: :user_edit
  patch 'me/add', to: 'users#update', as: :user_update
  get 'me/transactions', to: 'users#transactions', as: :user_transactions
end
