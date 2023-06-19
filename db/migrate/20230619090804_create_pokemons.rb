class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :weigth
      t.integer :height
      t.integer :price
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
