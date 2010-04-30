class CreateIngredients < ActiveRecord::Migration
  def self.up
	create_table :ingredients do |t|
      t.integer :menu_item_id
      t.integer :inventory_item_id
      t.integer :amount, :default => 0

      t.timestamps
	end
  end

  def self.down
	drop_table :ingredients
  end
end
