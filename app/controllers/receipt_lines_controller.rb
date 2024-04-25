class ReceiptLinesController < ApplicationController
  before_action :set_receipt_line, only: %i[ show edit update destroy ]

  # GET /receipt_lines or /receipt_lines.json
  def index
    @receipt_lines = ReceiptLine.all
  end

  # GET /receipt_lines/1 or /receipt_lines/1.json
  def show
  end

  # GET /receipt_lines/new
  def new
    @receipt_line = ReceiptLine.new
  end

  # GET /receipt_lines/1/edit
  def edit
  end

  # POST /receipt_lines or /receipt_lines.json
  def create
    @receipt_line = ReceiptLine.new(receipt_line_params)

    respond_to do |format|
      if @receipt_line.save
        format.html { redirect_to receipt_line_url(@receipt_line), notice: "Receipt line was successfully created." }
        format.json { render :show, status: :created, location: @receipt_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipt_lines/1 or /receipt_lines/1.json
  def update
    respond_to do |format|
      if @receipt_line.update(receipt_line_params)
        format.html { redirect_to receipt_line_url(@receipt_line), notice: "Receipt line was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_lines/1 or /receipt_lines/1.json
  def destroy
    @receipt_line.destroy

    respond_to do |format|
      format.html { redirect_to receipt_lines_url, notice: "Receipt line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_line
      @receipt_line = ReceiptLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_line_params
      params.require(:receipt_line).permit(:receipt_date, :receipt_account, :account_type, :account_no, :account_name, :amount, :invoiceno, :receipt_id)
    end
end
