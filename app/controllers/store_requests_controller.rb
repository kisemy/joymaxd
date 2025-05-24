class StoreRequestsController < ApplicationController
  before_action :set_store_request, only: %i[ show edit update destroy ]

  # GET /store_requests or /store_requests.json
  def index
    @store_requests = StoreRequest.all
     @items = Item.all 
  end

  # GET /store_requests/1 or /store_requests/1.json
  def show
  @items = Item.all 
  
  end

  # GET /store_requests/new
  def new
    @store_request = StoreRequest.new
      @store_requests = StoreRequest.all
       @items = Item.all 
  end

  # GET /store_requests/1/edit
  def edit
    @store_requests = StoreRequest.all
     @items = Item.all 
  end

  # POST /store_requests or /store_requests.json
  def create
   @items = Item.all 
    @store_request = StoreRequest.new(store_request_params)
  @store_requests = StoreRequest.all
    respond_to do |format|
      if @store_request.save
        format.html { redirect_to store_request_url(@store_request), notice: "Store request was successfully created." }
        format.json { render :show, status: :created, location: @store_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_requests/1 or /store_requests/1.json
  def update
   @items = Item.all 
    respond_to do |format|
      if @store_request.update(store_request_params)
        format.html { redirect_to store_request_url(@store_request), notice: "Store request was successfully updated." }
        format.json { render :show, status: :ok, location: @store_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_requests/1 or /store_requests/1.json
  def destroy
    @store_request.destroy

    respond_to do |format|
      format.html { redirect_to store_requests_url, notice: "Store request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_request
      @store_request = StoreRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
 def store_request_params
      params.require(:store_request).permit(:invoice_no, :request_date, :destination_type, :destination_code, :destination_name, :status, :warehouse_code, :Warehouse_name, :requsted_by, :request_status, :delivery_place, :internal_supply_id, :customer_clientcode, store_requestlines_attributes: [:code, :product_description, :quantity, :unit_cost, :amount, :received, :expiry_date, :batch_no, :stock_balance, :destination_code, :destination_name, :store_request_id])
    end
end


