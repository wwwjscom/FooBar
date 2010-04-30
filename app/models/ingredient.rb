class Ingredient < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :inventory_item
	
	def name
		InventoryItem.find(inventory_item_id).name
	end
end