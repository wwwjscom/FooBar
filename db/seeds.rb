# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Bar.create(:cash => 200)

InventoryItem.create(:name => "Bread", :quantity => 10, :wholesale_cost => 1)
InventoryItem.create(:name => "Apple", :quantity => 10, :wholesale_cost => 1)
InventoryItem.create(:name => "OJ", :quantity => 10, :wholesale_cost => 2)

MenuItem.create(:price => 5, :name => "Breakfast")

Ingredient.create(:inventory_item_id => 1, :menu_item_id => 1, :amount => 2)
Ingredient.create(:inventory_item_id => 2, :menu_item_id => 1, :amount => 1)
Ingredient.create(:inventory_item_id => 3, :menu_item_id => 1, :amount => 1)
