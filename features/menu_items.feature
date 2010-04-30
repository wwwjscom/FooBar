Feature: Menu item operations

	Scenario: List all menu items
		Given I am on the path /menu_items
		Then I should see "All Menu Items"
		
#	Scenario: Populate menu item edit form
#		Given I have a menu item
#		And I am on the path /menu_items
#		When I follow "Edit"
#		Then the "Ingrediants" field should contain "Coffee: 2\nMilk: 1\n"
		

	Scenario: Validate the correct ingredients are listed when adding an item
		Given I have a test item
		And I have a menu item
		And I am on the path /menu_items
		When I follow "New menu_item"
		Then I should see "Apple"
		
	Scenario: Ensure ingredients saved correctly and pluralize as needed
		Given I have a test item
		And I have a menu item
		And I have an inventory item "Banana"
		And I am on the path /menu_items
		When I follow "New menu_item"
		And I fill in "Apple" with "1"
		And I fill in "Banana" with "2"
		And I press "Create"
		Then I should see "1 Apple"
		And I should see "2 Bananas"