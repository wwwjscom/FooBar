Given /^I have an order$/ do
  Order.create(:menu_items => { MenuItem.first.id => "2" })
end

When /^foo$/ do
end
