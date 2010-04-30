Given /^I have a test item$/ do
	InventoryItem.create(:name => "Apple")
end

Given /^I have an inventory item "(.+)"$/ do |name|
	InventoryItem.create(:name => name)
end