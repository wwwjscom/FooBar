Given /^I have an inventory item$/ do
	InventoryItem.create(:name => "Apple")
end

Given /^I have an inventory item "(.+)"$/ do |name|
	InventoryItem.create(:name => name)
end

Then /^inventory item "([^\"]*)" should have quantity "([^\"]*)"$/ do |name, quantity|
  InventoryItem.find_by_name(name).quantity.should == quantity.to_i
end
