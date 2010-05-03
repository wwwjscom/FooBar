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

  # Given a menu item and the amount of said item ordered,
  # decrement the ingredient quantities accordingly.
  def self.decrement_inventory(id, ordered_amt)
    menu_item = find(id)
    menu_item.ingredients.each do |ingredient|
      inventory_item_id = ingredient.inventory_item_id
      amt = menu_item.amount(inventory_item_id) * ordered_amt.to_i
      return false unless InventoryItem.decrement(inventory_item_id, amt)
    end
  end
end
