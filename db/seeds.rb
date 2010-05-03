# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Bar.create(:cash => 20000)

InventoryItem.create(:name => "Bread", :quantity => 10, :wholesale_cost => 100)
InventoryItem.create(:name => "Apple", :quantity => 10, :wholesale_cost => 100)
InventoryItem.create(:name => "OJ", :quantity => 10, :wholesale_cost => 200)
InventoryItem.create(:name => "Egg", :quantity => 10, :wholesale_cost => 200)
InventoryItem.create(:name => "Bacon", :quantity => 20, :wholesale_cost => 100)
InventoryItem.create(:name => "Coffee", :quantity => 20, :wholesale_cost => 300)

MenuItem.create(:price => 500, :name => "Breakfast")
MenuItem.create(:price => 1000, :name => "Fix My Hangover")

Ingredient.create(:inventory_item_id => 1, :menu_item_id => 1, :amount => 2)
Ingredient.create(:inventory_item_id => 2, :menu_item_id => 1, :amount => 1)
Ingredient.create(:inventory_item_id => 3, :menu_item_id => 1, :amount => 1)

Ingredient.create(:inventory_item_id => 1, :menu_item_id => 2, :amount => 2)
Ingredient.create(:inventory_item_id => 4, :menu_item_id => 2, :amount => 3)
Ingredient.create(:inventory_item_id => 5, :menu_item_id => 2, :amount => 1)
Ingredient.create(:inventory_item_id => 6, :menu_item_id => 2, :amount => 2)
Ingredient.create(:inventory_item_id => 3, :menu_item_id => 2, :amount => 1)
