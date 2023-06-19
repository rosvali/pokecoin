class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = pokemon_finder
    @user = @pokemon.user
  end

  private

  def pokemon_finder
    Pokemon.find(params[:id])
  end
end
