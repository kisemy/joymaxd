class StocklinesController < ApplicationController
  before_action :set_stockline, only: %i[ show edit update destroy ]

  # GET /stocklines or /stocklines.json
  def index
    @stocklines = Stockline.all
  end

  # GET /stocklines/1 or /stocklines/1.json
  def show
  end

  # GET /stocklines/new
  def new
    @stockline = Stockline.new
  end

  # GET /stocklines/1/edit
  def edit
  end

  # POST /stocklines or /stocklines.json
  def create
    @stockline = Stockline.new(stockline_params)

    respond_to do |format|
      if @stockline.save
        format.html { redirect_to stockline_url(@stockline), notice: "Stockline was successfully created." }
        format.json { render :show, status: :created, location: @stockline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stockline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocklines/1 or /stocklines/1.json
  def update
    respond_to do |format|
      if @stockline.update(stockline_params)
        format.html { redirect_to stockline_url(@stockline), notice: "Stockline was successfully updated." }
        format.json { render :show, status: :ok, location: @stockline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stockline.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def find_by_description1
    item = Item.find_by(description: params[:description])
    if item
      render json: {
        product_description: item.description,
        stk_no: item.item_id,
        #quantity: item.quantity,
        unit_of_measure: item.units_of_measure,
        unit_price: item.unit_price,
        inventory_account: item.purchase_account
        #amount: item.amount
      }
    else
      render json: { error: 'Item not found' }, status: 404
    end
  end
  
  
  
  
  
  
  
  
  
  
  

  # DELETE /stocklines/1 or /stocklines/1.json
  def destroy
    @stockline.destroy

    respond_to do |format|
      format.html { redirect_to stocklines_url, notice: "Stockline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockline
      @stockline = Stockline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stockline_params
      params.require(:stockline).permit(:stk_no, :code, :product_description, :quantity, :unit_cost, :unit_price, :amount, :received, :expiry_date, :batch_no, :product_category, :date, :unit_of_measure, :warehouse_code, :warehouse_name, :quantity_expected, :quality_check, :comment, :ref_no)
    end
end
