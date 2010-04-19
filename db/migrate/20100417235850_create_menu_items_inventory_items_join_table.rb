class CreateMenuItemsInventoryItemsJoinTable < ActiveRecord::Migration
  def self.up
	create_table :inventory_items_menu_items, :id => false do |t|
		t.integer :menu_item_id
		t.integer :inventory_item_id
		t.integer :amount
	end
  end

  def self.down
	drop_table :inventory_items_menu_items
  end
end
