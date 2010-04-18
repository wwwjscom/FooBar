Feature: Menu item operations

	Scenario: List all menu items
		Given I am on the path /menu_items
		Then I should see "All Menu Items"
		
#	Scenario: Populate menu item edit form
#		Given I have a menu item
#		And I am on the path /menu_items
#		When I follow "Edit"
#		Then the "Ingrediants" field should contain "Coffee: 2\nMilk: 1\n"
		
	Scenario: Validate ingredients on edit
		Given I have a menu item
		And I am on the path /menu_items
		When I follow "Edit"
		And I fill in "Ingrediants" with "Foo: 2\n"
		And I press "Update"
		Then I should see "Error"