class CreateInventoryItems < ActiveRecord::Migration
  def self.up
	create_table :inventory_items do |t|
		t.string :name
	end
  end

  def self.down
	drop_table :inventory_items
  end
end
