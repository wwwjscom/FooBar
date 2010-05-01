class Order < ActiveRecord::Base
	serialize :menu_items, Hash
	
  # Sets the order total based on a hash containing
  # menu_item_ids => amount_in_order
	def set_total=(menu_items_hash)
		t = 0
		menu_items_hash.each do |menu_item_id, amt|
			t += MenuItem.find(menu_item_id).price * amt.to_i
		end
		self.total = t
	end

end
