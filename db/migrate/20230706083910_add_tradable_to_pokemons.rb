class AddTradableToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :tradable, :boolean, default: false
  end
end
