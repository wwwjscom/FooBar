Feature: Test the bar functions


	Scenario: Creating an order increases the cash on hand
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		And I follow "Home"
		Then I should see "Cash on hand: $10.00"

	Scenario: Editing an order results in the correct cash on hand
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		And I follow "Orders"
		And I follow "Edit"
		And I fill in "Test" with "1"
		And I press "Update"
		And I follow "Home"
		Then I should see "Cash on hand: $5.00"

	Scenario: Editing an order results in the correct cash on hand (part 2)
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		And I follow "Orders"
		And I follow "Edit"
		And I fill in "Test" with "3"
		And I press "Update"
		And I follow "Home"
		Then I should see "Cash on hand: $15.00"
