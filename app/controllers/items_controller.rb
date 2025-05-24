class ItemsController < ApplicationController
  #before_action :set_item, only: %i[ show edit update destroy ]

 before_action :set_item, only: [:show, :edit, :update, :destroy]
  #before_action :load_chart_of_accounts, only: [:new, :edit, :create, :update]




  # GET /items or /items.json
  def index
    @items = Item.all
     @chart_of_accounts = ChartOfAccount.all
  end

  # GET /items/1 or /items/1.json

   def show
   @chart_of_accounts = ChartOfAccount.all
   
    item = Item.find(params[:id])
    #render json: item
  end
   
   


  # GET /items/new
  def new
    @item = Item.new
     @chart_of_accounts = ChartOfAccount.all
  end

  # GET /items/1/edit
  def edit
   @chart_of_accounts = ChartOfAccount.all
  end 

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
 @chart_of_accounts = ChartOfAccount.all
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


#def update
#  if params[:item][:sales_account].present?
    # Find the ChartOfAccount by ID and assign it
   # @item.sales_account = ChartOfAccount.find(params[:item][:sales_account])
  #end

 # respond_to do |format|
 #   if @item.update(item_params.except(:sales_account))  # Avoid double assignment
  #    format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
   #   format.json { render :show, status: :ok, location: @item }
    #else
     # format.html { render :edit, status: :unprocessable_entity }
     # format.json { render json: @item.errors, status: :unprocessable_entity }
    #end
  #end
#end







  # PATCH/PUT /items/1 or /items/1.json
  def update
   @chart_of_accounts = ChartOfAccount.all
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
       # product_description: item.description,
        #item_id: item.item_id,
        #quantity: item.quantity,
        #units_of_measure: item.units_of_measure,
        #unit_price: item.unit_price,
      #  purchase_account: item.purchase_account
        #amount: item.amount
      }
    else
      render json: { error: 'Item not found' }, status: 404
    end
  end
  
  
  
  

  
  
  
  
  
  

  private
  
  #def load_chart_of_accounts,
   # @chart_of_accounts = ChartOfAccount.all.order(:name)
 # end
  
  
  
  
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
           params.require(:item).permit(:description, :units_of_measure, :unit_cost, :unit_price, :inventory, :shelf_no, :item_category, :sales_acc_name, :cost_account, :cost_acc_name, :purchase_account, :purchase_acc_name, :sales_description, :sales_account)
     end
#end

#def item_params
 
  #params.require(:item).permit(:description, :units_of_measure, :unit_cost, :unit_price, 
                             # :inventory, :shelf_no, :item_category, :sales_acc_name,
                             # :cost_acc_name, :sales_account, :cost_account, :purchase_account, :purchase_acc_name).tap do |whitelisted|
    #whitelisted[:sales_account] = ChartOfAccount.find_by(no: params[:item][:sales_account])
    #whitelisted[:cost_account] = ChartOfAccount.find_by(no: params[:item][:cost_account])
    #whitelisted[:purchase_account] = ChartOfAccount.find_by(no: params[:item][:purchase_account])
  #end  
  
  #end
  
  
 end
 
 
 
