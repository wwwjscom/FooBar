Given /^I have a menu item$/ do
	MenuItem.create(:price => 5, :name => "Test", :ingrediants => { "Coffee" => 2, "Milk" => 1})
end