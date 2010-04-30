class MenuItem < ActiveRecord::Base
	has_many :ingredients, :class_name => "Ingredient"
	
	# Returns the amount of a particular ingredient that
	# this menu item uses
	def amount(inventory_item_id)
		begin
			ingredients.find_by_inventory_item_id(inventory_item_id).amount
		rescue
			0
		end
	end
end
