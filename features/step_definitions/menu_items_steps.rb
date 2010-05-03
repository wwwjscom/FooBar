Given /^I have a menu item$/ do
	MenuItem.create(:price => 5, :name => "Test")
end

Given /^I have a menu item "(.+)"$/ do |name|
	MenuItem.create(:price => 5, :name => name)
end

Given /^I have a menu item with ingredients$/ do
	MenuItem.create(:price => 5, :name => "Test")
	InventoryItem.create(:name => "Apple", :quantity => 10, :wholesale_cost => 1)
	InventoryItem.create(:name => "Banana", :quantity => 10, :wholesale_cost => 2)
	Ingredient.create(:menu_item_id => 1, :inventory_item_id => 1, :amount => 1)
	Ingredient.create(:menu_item_id => 1, :inventory_item_id => 2, :amount => 2)
end
