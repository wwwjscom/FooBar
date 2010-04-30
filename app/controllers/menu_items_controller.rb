class MenuItemsController < ApplicationController
  # GET /menu_items
  # GET /menu_items.xml
  def index
    @menu_items = MenuItem.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.xml
  def show
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/new
  # GET /menu_items/new.xml
  def new
    @menu_item = MenuItem.new
	@ingredients_list = InventoryItem.all
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
	@ingredients_list = InventoryItem.all
  end

  # POST /menu_items
  # POST /menu_items.xml
  def create
    @menu_item = MenuItem.new(params[:menu_item])

	menu_item_did_save = @menu_item.save
	
	# Save all the ingredients
	save_ingrediants

    respond_to do |format|
      if menu_item_did_save
        flash[:notice] = 'MenuItem was successfully created.'
        format.html { redirect_to(@menu_item) }
        format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    @menu_item = MenuItem.find(params[:id])

	@menu_item.ingredients.destroy_all
	save_ingrediants

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        flash[:notice] = 'MenuItem was successfully updated.'
        format.html { redirect_to(@menu_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.xml
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to(menu_items_url) }
      format.xml  { head :ok }
    end
  end


	private #------------------
	
	
	def save_ingrediants
		# Save all the ingredients
		params[:ingredients].each do |i, ingredient_hash|
			# Only add ingredients that have values
			if ingredient_hash[:amount].to_i > 0
				ingredient_hash[:menu_item_id] = @menu_item[:id]
				Ingredient.create(ingredient_hash)
			end
		end
	end
end
