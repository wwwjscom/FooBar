class Order < ActiveRecord::Base
	serialize :menu_items, Hash
  before_save :set_total, :decrement_inventory

  private #-----------
	
  # Sets the order total based on a hash containing
  # menu_item_ids => amount_in_order
	def set_total
    self.total = 0
		self.menu_items.each do |menu_item_id, amt|
			self.total += MenuItem.find(menu_item_id).price * amt.to_i
		end
	end

  # Subtract from out inventory the amount in ingredients required
  # to complete the order.  If we don't have a sufficient amount,
  # return false.
  def decrement_inventory
    self.menu_items.each do |menu_item_id, amt|
      unless MenuItem.decrement_inventory(menu_item_id, amt)
        # add error msg to form and return false since not enough ingredients
        # exist to fulfill the order
        errors.add_to_base("Not enough ingredients left in inventory to complete this order")
        return false
      end
    end
  end

end
