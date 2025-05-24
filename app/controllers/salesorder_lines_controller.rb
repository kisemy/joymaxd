class SalesorderLinesController < ApplicationController
  before_action :set_salesorder_line, only: %i[ show edit update destroy ]

  # GET /salesorder_lines or /salesorder_lines.json
  def index
    @salesorder_lines = SalesorderLine.all
  end

  # GET /salesorder_lines/1 or /salesorder_lines/1.json
  def show
  end

  # GET /salesorder_lines/new
  def new
    @salesorder_line = SalesorderLine.new
  end

  # GET /salesorder_lines/1/edit
  def edit
  end

  # POST /salesorder_lines or /salesorder_lines.json
  def create
    @salesorder_line = SalesorderLine.new(salesorder_line_params)

    respond_to do |format|
      if @salesorder_line.save
        format.html { redirect_to salesorder_line_url(@salesorder_line), notice: "Salesorder line was successfully created." }
        format.json { render :show, status: :created, location: @salesorder_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salesorder_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salesorder_lines/1 or /salesorder_lines/1.json
  def update
    respond_to do |format|
      if @salesorder_line.update(salesorder_line_params)
        format.html { redirect_to salesorder_line_url(@salesorder_line), notice: "Salesorder line was successfully updated." }
        format.json { render :show, status: :ok, location: @salesorder_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salesorder_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salesorder_lines/1 or /salesorder_lines/1.json
  def destroy
    @salesorder_line.destroy

    respond_to do |format|
      format.html { redirect_to salesorder_lines_url, notice: "Salesorder line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salesorder_line
      @salesorder_line = SalesorderLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salesorder_line_params
      params.require(:salesorder_line).permit(:charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount)
    end
end
