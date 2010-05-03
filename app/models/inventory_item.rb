class InventoryItem < ActiveRecord::Base
  before_create :set_cash_on_hand
  before_update :update_cash_on_hand
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

  private #----------

  def update_cash_on_hand
    old_inventory = InventoryItem.find(id)
    old_total = old_inventory.quantity * old_inventory.wholesale_cost
    Bar.cash = Bar.cash - ((quantity * wholesale_cost) - old_total)
  end

  def set_cash_on_hand
    Bar.cash = Bar.cash - (wholesale_cost * quantity)
  end

end
