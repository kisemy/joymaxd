class StoreRequestlinesController < ApplicationController
  before_action :set_store_requestline, only: %i[ show edit update destroy ]

  # GET /store_requestlines or /store_requestlines.json
  def index
    @store_requestlines = StoreRequestline.all
  end

  # GET /store_requestlines/1 or /store_requestlines/1.json
  def show
  end

  # GET /store_requestlines/new
  def new
    @store_requestline = StoreRequestline.new
  end

  # GET /store_requestlines/1/edit
  def edit
  end

  # POST /store_requestlines or /store_requestlines.json
  def create
    @store_requestline = StoreRequestline.new(store_requestline_params)

    respond_to do |format|
      if @store_requestline.save
        format.html { redirect_to store_requestline_url(@store_requestline), notice: "Store requestline was successfully created." }
        format.json { render :show, status: :created, location: @store_requestline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_requestline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_requestlines/1 or /store_requestlines/1.json
  def update
    respond_to do |format|
      if @store_requestline.update(store_requestline_params)
        format.html { redirect_to store_requestline_url(@store_requestline), notice: "Store requestline was successfully updated." }
        format.json { render :show, status: :ok, location: @store_requestline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_requestline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_requestlines/1 or /store_requestlines/1.json
  def destroy
    @store_requestline.destroy

    respond_to do |format|
      format.html { redirect_to store_requestlines_url, notice: "Store requestline was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_requestline
      @store_requestline = StoreRequestline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_requestline_params
      params.require(:store_requestline).permit(:code, :product_description, :quantity, :unit_cost, :amount, :received, :expiry_date, :batch_no, :stock_balance, :destination_code, :destination_name, :store_request_id)
    end
end
