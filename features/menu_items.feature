Feature: Menu item operations

	Scenario: List all menu items
		Given I am on the path /menu_items
		Then I should see "All Menu Items"

	Scenario: Validate the correct ingredients are listed when adding an item
		Given I have an inventory item
		And I have a menu item
		And I am on the path /menu_items
		When I follow "New menu_item"
		Then I should see "Apple"
		
	Scenario: Test creating/showing and pluralize ingredients as needed
		Given I have an inventory item
		And I have an inventory item "Banana"
		And I am on the path /menu_items
		When I follow "New menu_item"
		And I fill in "Name" with "Smoothie"
		And I fill in "Apples" with "1"
		And I fill in "Bananas" with "2"
		And I press "Create"
		Then I should see "1 Apple"
		And I should see "2 Bananas"
		And I should see "Smoothie"

	Scenario: Verify ingredient amounts on edit
		Given I have an inventory item
		And I have an inventory item "Banana"
		And I am on the path /menu_items
		When I follow "New menu_item"
		And I fill in "Name" with "Smoothie"
		And I fill in "Apples" with "1"
		And I fill in "Bananas" with "2"
		And I press "Create"
		And I follow "Edit"
		Then the "Apples" field should contain "1"
		And the "Bananas" field should contain "2"
	
	Scenario: Editing
		Given I have a menu item
		And I have an inventory item "Banana"
		And I am on the path /menu_items
		When I follow "Edit"
		And I fill in "Bananas" with "40"
		And I press "Update"
		Then I should see "40 Bananas"
		
	Scenario: Edit an ingredient thats > 0 to a value of 0.  Doing so should make it so it does not get inserted into the db again.
		Given I have a menu item
		And I have an inventory item "Banana"
		And I am on the path /menu_items
		When I follow "Edit"
		And I fill in "Bananas" with "0"
		And I press "Update"
		Then I should not see "Bananas"
		And I should not see "Banana"
		
		Scenario: Add an ingredient thats > 0 to a value of 0.  Doing so should make it so it does not get inserted into the db again.
			Given I have an inventory item "Banana"
			And I am on the path /menu_items
			When I follow "New menu_item"
			And I fill in "Bananas" with "0"
			And I press "Create"
			Then I should not see "Bananas"
			And I should not see "Banana"