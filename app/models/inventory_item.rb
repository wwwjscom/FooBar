class InventoryItem < ActiveRecord::Base
	has_many :ingredient

  # Decrement the quantity for the given item by the amt
  def self.decrement(id, amt)
    item = find(id)
    if (item.quantity - amt) < 0
      return false 
    else
      item.update_attribute(:quantity, item.quantity - amt)
    end
  end
end
