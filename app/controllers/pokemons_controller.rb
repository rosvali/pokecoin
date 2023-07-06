class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = pokemon_finder
    @user = @pokemon.user
  end

  def update
    pokemon = pokemon_finder
    trade = pokemon.tradable ? false : true
    pokemon.update(tradable: trade)
  end

  def checkout
    @pokemon = pokemon_finder
  end

  def buy
    @pokemon = pokemon_finder
    vendor = pokemon_finder.user
    price = @pokemon.price
    if current_user.balance >= @pokemon.price && current_user != vendor
      Transaction.create(pokemon: @pokemon, user: current_user, action: 0)
      @pokemon.update(user: current_user, tradable: false)
      balance = current_user.balance - price
      current_user.update(balance: balance)
      sell(vendor, @pokemon)
      redirect_to user_path(current_user.id), notice: "Vente conclue !"
    else
      flash.alert = "Pas assez de thunasse t'es trop pauvre cheh"
      render 'checkout'
    end
  end
  
  private
  
  def pokemon_finder
    Pokemon.find(params[:id])
  end
  
  def sell(vendor, pokemon)
    Transaction.create(pokemon: pokemon, user: vendor, action: 1)
    balance = vendor.balance + pokemon.price
    vendor.update(balance: balance)
  end
end
