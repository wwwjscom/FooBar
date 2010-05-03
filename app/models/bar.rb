class Bar < ActiveRecord::Base
  set_table_name "bar"

  # Verify we have enough cash on hand to buy the inventory
  def self.enough_cash?(quantity, price)
    Bar.cash >= quantity.to_i * price.to_f
  end

  def self.cash=(new_cash)
    self.find(:first).update_attribute(:cash, new_cash)
  end

  def self.cash
    self.find(:first).cash
  end
end
