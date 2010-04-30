class InventoryItem < ActiveRecord::Base
	
	has_many :ingredient
	
	def self.ids_names_hash
		find(:all).map { |i| { :id => i.id, :name => i.name } }
	end
end