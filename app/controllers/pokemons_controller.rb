class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = pokemon_finder
    @user = @pokemon.user
  end

  # def checkout
  #   pokemon = pokemon_finder
  #   user = pokemon.user
  #   price = pokemon.price
  #   balance = current_user.balance
  #   render json: { pokemon: pokemon, vendeur: user, prix: price, balance: balance }, status: 200
  # end

  # def buy
  #   pokemon = pokemon_finder
  #   vendeur = pokemon_finder.user
  #   if current_user.balance >= pokemon.price && current_user != vendeur
  #     Transaction.create(pokemon: pokemon, user: current_user, action: 0)
  #     Transaction.create(pokemon: pokemon, user: vendeur, action: 1)
  #     render json: pokemon, status: 200
  #   else
  #     render json: {message: "no"}, status: 500
  #   end
  # end

  private

  def pokemon_finder
    Pokemon.find(params[:id])
  end
end
