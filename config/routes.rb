Rails.application.routes.draw do
  root 'pages#home'
  resources :pokemons
  devise_for :users, only: [:show]
end
