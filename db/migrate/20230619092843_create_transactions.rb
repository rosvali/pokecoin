class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :pokemon, index: true
      t.integer :action, default: 0
      t.timestamps
    end
  end
end
