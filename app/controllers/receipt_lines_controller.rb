class ReceiptLinesController < ApplicationController
 
# validates :account_no, presence: true 

  def new
    @receipt_line = ReceiptLine.new
     @banks = Bank.all
    @customers = Customer.all
    @chart_of_accounts = ChartOfAccount.all
    
    load_references
  end

  def create
  load_references
    @receipt_line = ReceiptLine.new(receipt_line_params)

    if @receipt_line.save
      redirect_to @receipt_line, notice: 'Receipt line was successfully created.'
    else
      render :new
    end
  end

  def edit
    @receipt_line = ReceiptLine.find(params[:id])
  end

  def update
    @receipt_line = ReceiptLine.find(params[:id])

    if @receipt_line.update(receipt_line_params)
      redirect_to @receipt_line, notice: 'Receipt line was successfully updated.'
    else
      render :edit
    end
  end
  
  def index
   @receipt_lines = ReceiptLine.all
  
  end


  private

  
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_line
      @receipt_line = ReceiptLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_line_params
      params.require(:receipt_line).permit(:receipt_date, :receipt_account, :account_type, :account_no, :account_name, :bank_name, :customer_name, :amount, :invoiceno, :receipt_id)
    end
    
    
    def load_references
    @banks = Bank.all
    @customers = Customer.all
    @chart_of_accounts = ChartOfAccount.all
  end
    
    
end


