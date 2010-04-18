class CreateMenuItemsInventoryItemsJoinTable < ActiveRecord::Migration
  def self.up
	create_table :menu_items_inventory_items, :id => false do |t|
		t.integer :menu_item_id
		t.integer :inventory_item_id
	end
  end

  def self.down
	drop_table :menu_items_inventory_items
  end
end
