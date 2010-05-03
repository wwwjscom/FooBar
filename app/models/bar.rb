class Bar < ActiveRecord::Base
  set_table_name "bar"

  def self.cash=(new_cash)
    self.find(:first).update_attribute(:cash, new_cash)
  end

  def self.cash
    self.find(:first).cash
  end
end
