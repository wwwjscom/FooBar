Feature: Test the bar functions


	Scenario: Creating an order increases the cash on hand
		Given I am on the path /orders
		And I have a menu item with ingredients
		When I follow "New Order"
		And I fill in "Test" with "2"
		And I press "Create"
		And I follow "Home"
		Then I should see "Cash on hand: $-20.00"

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
		Then I should see "Cash on hand: $-25.00"

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
		Then I should see "Cash on hand: $-15.00"

  Scenario: Creating inventory items reduces cash on hand
    Given I am on path /inventory_items
		When I follow "New"
		And I fill in "Name" with "My new item"
		And I fill in "Quantity" with "5"
		And I fill in "Wholesale cost" with "200"
		And I press "Create"
    And I follow "Home"
    Then I should see "Cash on hand: $-10.00"

#  Scenario: Editing inventory items reduces cash on hand
#		Given I have an inventory item
#    And I am on path /inventory_items
#		When I follow "Edit"
#		And I fill in "Quantity" with "10"
#		And I press "Update"
#    And I follow "Home"
#    Then I should see "Cash on hand: $-20.00"
