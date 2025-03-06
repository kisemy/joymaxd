class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json

   def show
    item = Item.find(params[:id])
    render json: item
  end
   
   


  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  
  def find_by_description
    item = Item.find_by(description: params[:description])
    if item
      render json: {
        description: item.description,
        #item_id: item.item_id,
        #quantity: item.quantity,
        unit_of_measure: item.units_of_measure,
        unit_price: item.unit_price,
        #amount: item.amount
      }
    else
      render json: { error: 'Item not found' }, status: 404
    end
  end
  

  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:description, :units_of_measure, :unit_cost, :unit_price, :inventory, :shelf_no, :item_category)
    end
end



