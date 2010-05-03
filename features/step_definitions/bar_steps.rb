Given /^I have a wealthy bar$/ do
  Bar.create(:cash => 1000000000)
end
