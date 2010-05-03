class Bar < ActiveRecord::Base
  set_table_name "bar"

  def self.cash=(cash)
    find(:first).update_attribute(:cash, cash)
  end

  def self.cash
    find(:first).cash
  end
end
