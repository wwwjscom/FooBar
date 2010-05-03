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
		Then I should see "$10.00"
		And I should see "Tests (x2) $5.00/each"
	
	Scenario: Edit Order populate correctly
		Given I have a menu item with ingredients
		And I have a menu item "foo"
		And I have an order
		And I am on the path /orders
		When I follow "Edit"
		Then the "Test" field should contain "2"
		And the "Foo" field should contain "0"

	Scenario: Edit Order populate correctly (part 2)
		Given I have a menu item with ingredients
		And I have a menu item with ingredients
		And I am on the path /orders
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		And I follow "Edit"
		Then the "Test" field should contain "2"

	Scenario: Update order
		Given I have a menu item with ingredients
		And I have an order
		And I am on the path /orders
		When I follow "Edit"
		And I fill in "Test" with "3"
		And I press "Update"
		Then I should see "Tests (x3) $5.00/each"
		And I should see "$15.00"

	Scenario: Ordering decrements the quantity of inventory items
		Given I have a menu item with ingredients
		And I have an order
		Then inventory item "Apple" should have quantity "8"

	Scenario: Ordering an order which cannot be fulfilled should error
		Given I have a menu item with ingredients
		And I have an order
		And I am on the path /orders
		When I follow "Edit"
		And I fill in "Test" with "10"
		And I press "Update"
		Then I should see "1 error prohibited this order from being saved"
