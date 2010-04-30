class MenuItem < ActiveRecord::Base
	has_many :ingredients, :class_name => "Ingredient"
end
