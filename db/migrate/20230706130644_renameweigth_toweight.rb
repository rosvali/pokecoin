class RenameweigthToweight < ActiveRecord::Migration[7.0]
  def change
    rename_column :pokemons, :weigth, :weight
  end
end
