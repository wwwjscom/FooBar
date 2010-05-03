Feature: Managing Inventory Items

	Scenario: View all inventory items
		Given I am on path /inventory_items
		Then I should see "All Inventory Items"
		
	Scenario: Create
		Given I am on path /inventory_items
		When I follow "New"
		And I fill in "Name" with "My new item"
		And I fill in "Quantity" with "5"
		And I press "Create"
		Then I should see "Inventory item created"
		And I should be on the path /inventory_items
		And I should see "My new item"
		And I should see "5"
		
	Scenario: Populate edit for with data
		Given I have an inventory item
		And I am on path /inventory_items	
		When I follow "Edit"
		Then the "Name" field should contain "Apple"
		And the "Quantity" field should contain "5"
		
	Scenario: Edit
		Given I have an inventory item
		And I am on path /inventory_items
		When I follow "Edit"
		And I fill in "Name" with "My new item"
		And I fill in "Quantity" with "10"
		And I press "Update"
		Then I should see "Inventory item updated"
		And I should be on the path /inventory_items
		And I should see "My new item"
		And I should see "10"
		
	Scenario: Delete item
		Given I have an inventory item
		And I am on path /inventory_items
		When I follow "Delete"
		Then I should see "Inventory item deleted"
		And I should not see "Apple"
		And I should not see "10"
