class InventoryItem < ActiveRecord::Base
	has_many :ingredient
end