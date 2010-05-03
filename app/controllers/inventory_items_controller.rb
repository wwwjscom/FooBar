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
    new_quantity = params[:inventory_item][:quantity].to_i

    unless Bar.enough_cash?((new_quantity - @item.quantity), @item.wholesale_cost)
      flash[:error] = "Not enough cash on hand to complete transaction"
      render :edit
      return false
    end
		
    @item.update_cash_on_hand(new_quantity)

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
