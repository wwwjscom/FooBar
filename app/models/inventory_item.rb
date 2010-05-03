class InventoryItem < ActiveRecord::Base
  before_create :set_cash_on_hand
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

  # This method gets caled when we increment our inventory supply,
  # but not when a new order is created
  def update_cash_on_hand(quantity)
    old_inventory = InventoryItem.find(id)
    Bar.cash = (Bar.cash - (quantity - old_inventory.quantity) * wholesale_cost)
  end

  private #----------

  def set_cash_on_hand
    Bar.cash = Bar.cash - (wholesale_cost * quantity)
  end

end
