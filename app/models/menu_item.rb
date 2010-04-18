class MenuItem < ActiveRecord::Base
	#has_and_belongs_to_many :inventory_items
	serialize :ingrediants, Hash
	
#	before_validation :string_to_hash
	
	def string_to_hash
		if :ingrediants.class == String

		end
	end
	
	def ingrediants
		#if self[:ingrediants].class == Hash
		i = ""
		self[:ingrediants].each_pair { |key, value| i << "#{key}: #{value}\n" }
		self[:ingrediants] = i
		#end
	end
	
	def ingrediants=(ingrediants)
		if ingrediants.class == String
			logger.info "STRING"
			logger.info ingrediants
			
			ingrediants.split('\n').each do |line|
				item, amt = line.split(": ")
				unless InventoryItem.exists?(item)
					errors.add_to_base("Invalid Ingrediant")
				end
			end
			
		end
		
		if ingrediants.class == Hash
			logger.info "HASH"
		end
	end
end
