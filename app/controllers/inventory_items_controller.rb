class InventoryItemsController < ApplicationController
	def index
		@items = InventoryItem.find(:all)
	end
	
	def new
		@item = InventoryItem.new
	end
	
	def create
		item = InventoryItem.new(params[:inventory_item])
		item.save
		flash[:success] = "Inventory item created"
		redirect_to inventory_items_path
	end
	
	def edit
		@item = InventoryItem.find(params[:id])
	end
	
	def update
		@item = InventoryItem.find(params[:id])
		
		@item.update_attributes(params[:inventory_item])
		flash[:success] = "Inventory item updated"
		redirect_to inventory_items_path
	end
	
	def destroy
		if InventoryItem.delete(params[:id])
			flash[:success] = "Inventory item deleted"
			redirect_to inventory_items_path
		else
			flash[:error] = "Inventory item not deleted"
			redirect_to inventory_items_path
		end
	end
end