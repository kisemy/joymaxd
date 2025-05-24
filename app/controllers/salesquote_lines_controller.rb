class SalesquoteLinesController < ApplicationController
  before_action :set_salesquote_line, only: %i[ show edit update destroy ]

  # GET /salesquote_lines or /salesquote_lines.json
  def index
    @salesquote_lines = SalesquoteLine.all
  end

  # GET /salesquote_lines/1 or /salesquote_lines/1.json
  def show
  end

  # GET /salesquote_lines/new
  def new
    @salesquote_line = SalesquoteLine.new
  end

  # GET /salesquote_lines/1/edit
  def edit
  end

  # POST /salesquote_lines or /salesquote_lines.json
  def create
    @salesquote_line = SalesquoteLine.new(salesquote_line_params)

    respond_to do |format|
      if @salesquote_line.save
        format.html { redirect_to salesquote_line_url(@salesquote_line), notice: "Salesquote line was successfully created." }
        format.json { render :show, status: :created, location: @salesquote_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salesquote_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salesquote_lines/1 or /salesquote_lines/1.json
  def update
    respond_to do |format|
      if @salesquote_line.update(salesquote_line_params)
        format.html { redirect_to salesquote_line_url(@salesquote_line), notice: "Salesquote line was successfully updated." }
        format.json { render :show, status: :ok, location: @salesquote_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salesquote_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salesquote_lines/1 or /salesquote_lines/1.json
  def destroy
    @salesquote_line.destroy

    respond_to do |format|
      format.html { redirect_to salesquote_lines_url, notice: "Salesquote line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salesquote_line
      @salesquote_line = SalesquoteLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salesquote_line_params
      params.require(:salesquote_line).permit(:charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount)
    end
end
