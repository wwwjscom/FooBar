Feature: Test all aspects of placing an order

	Scenario: The menu displays correctly
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New order"
		Then I should see "Test"
		And the "Test" field should contain "0"
		And I should see "5.00"
		
	Scenario: Place Order
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		Then I should see "10.00"