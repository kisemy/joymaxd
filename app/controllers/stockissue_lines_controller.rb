class StockissueLinesController < ApplicationController
  before_action :set_stockissue_line, only: %i[ show edit update destroy ]

  # GET /stockissue_lines or /stockissue_lines.json
  def index
    @stockissue_lines = StockissueLine.all
  end

  # GET /stockissue_lines/1 or /stockissue_lines/1.json
  def show
  end

  # GET /stockissue_lines/new
  def new
    @stockissue_line = StockissueLine.new
  end

  # GET /stockissue_lines/1/edit
  def edit
  end

  # POST /stockissue_lines or /stockissue_lines.json
  def create
    @stockissue_line = StockissueLine.new(stockissue_line_params)

    respond_to do |format|
      if @stockissue_line.save
        format.html { redirect_to stockissue_line_url(@stockissue_line), notice: "Stockissue line was successfully created." }
        format.json { render :show, status: :created, location: @stockissue_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stockissue_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockissue_lines/1 or /stockissue_lines/1.json
  def update
    respond_to do |format|
      if @stockissue_line.update(stockissue_line_params)
        format.html { redirect_to stockissue_line_url(@stockissue_line), notice: "Stockissue line was successfully updated." }
        format.json { render :show, status: :ok, location: @stockissue_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stockissue_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockissue_lines/1 or /stockissue_lines/1.json
  def destroy
    @stockissue_line.destroy

    respond_to do |format|
      format.html { redirect_to stockissue_lines_url, notice: "Stockissue line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockissue_line
      @stockissue_line = StockissueLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stockissue_line_params
      params.require(:stockissue_line).permit(:code, :product_description, :issued_quantity, :unit_cost, :amount, :issued, :stock_balance, :expiry_date, :batch_no, :expired, :batch_quantity, :client_code, :latest_expiry, :client_name, :stockout_header_id)
    end
end
