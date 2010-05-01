class Order < ActiveRecord::Base
	serialize :menu_items, Hash
  before_save :set_total

  private #-----------
	
  # Sets the order total based on a hash containing
  # menu_item_ids => amount_in_order
	def set_total
    self.total = 0
		self.menu_items.each do |menu_item_id, amt|
			self.total += MenuItem.find(menu_item_id).price * amt.to_i
		end
	end

end
