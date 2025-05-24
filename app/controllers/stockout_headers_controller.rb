class StockoutHeadersController < ApplicationController
  before_action :set_stockout_header, only: %i[ show edit update destroy ]

  # GET /stockout_headers or /stockout_headers.json
  def index
    @stockout_headers = StockoutHeader.all
  end

  # GET /stockout_headers/1 or /stockout_headers/1.json
  def show
  end

  # GET /stockout_headers/new
  def new
    @stockout_header = StockoutHeader.new
  end

  # GET /stockout_headers/1/edit
  def edit
  end

  # POST /stockout_headers or /stockout_headers.json
  def create
    @stockout_header = StockoutHeader.new(stockout_header_params)

    respond_to do |format|
      if @stockout_header.save
        format.html { redirect_to stockout_header_url(@stockout_header), notice: "Stockout header was successfully created." }
        format.json { render :show, status: :created, location: @stockout_header }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stockout_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockout_headers/1 or /stockout_headers/1.json
  def update
    respond_to do |format|
      if @stockout_header.update(stockout_header_params)
        format.html { redirect_to stockout_header_url(@stockout_header), notice: "Stockout header was successfully updated." }
        format.json { render :show, status: :ok, location: @stockout_header }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stockout_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockout_headers/1 or /stockout_headers/1.json
  def destroy
    @stockout_header.destroy

    respond_to do |format|
      format.html { redirect_to stockout_headers_url, notice: "Stockout header was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockout_header
      @stockout_header = StockoutHeader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stockout_header_params
      params.require(:stockout_header).permit(:stko, :request_no, :client_code, :client_name, :address, :email, :telephone, :client_category, :status, :warehouse_code, :warehouse_name, :request_date, :release_date, :requested_by, :issued)
    end
end
