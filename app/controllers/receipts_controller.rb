class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy ]
 before_action :find_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts or /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1 or /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    @receipt.receiptlines.build
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts or /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:receipt_date, :bank_code, :description, :received_by, :receipt_by, :receipt_mode, :receipt_description, :status, :document_no, :amount, :received_from, :account_type, :accountno, receipt_lines_attributes: [:receipt_date, :receipt_account, :account_type, :account_no, :account_name, :amount, :invoiceno, :receipt_id, :_destroy])
end

def find_receipt
   @receipt = Receipt.find_by(id: params[:id])
  end
end
