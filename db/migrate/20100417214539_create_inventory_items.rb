class CreateInventoryItems < ActiveRecord::Migration
  def self.up
	create_table :inventory_items do |t|
		t.string :name
    t.integer :quantity, :default => 0
	end
  end

  def self.down
	drop_table :inventory_items
  end
end
