Feature: Managing Inventory Items

	Scenario: View all inventory items
		Given I am on path /inventory_items
		Then I should see "All Inventory Items"
		
	Scenario: Create
		Given I am on path /inventory_items
		When I follow "New"
		And I fill in "Name" with "My new item"
		And I press "Create"
		Then I should see "Inventory item created"
		And I should be on the path /inventory_items
		And I should see "My new item"
		
	Scenario: Populate edit for with data
		Given I have a test item
		And I am on path /inventory_items		
		When I follow "Edit"
		Then the "Name" field should contain "Apple"
		
	Scenario: Edit
		Given I have a test item
		And I am on path /inventory_items		
		When I follow "Edit"
		And I fill in "Name" with "My new item"
		And I press "Update"
		Then I should see "Inventory item updated"
		And I should be on the path /inventory_items
		And I should see "My new item"
		
	Scenario: Delete item
		Given I have a test item
		And I am on path /inventory_items
		When I follow "Delete"
		Then I should see "Inventory item deleted"
		And I should not see "Apple"