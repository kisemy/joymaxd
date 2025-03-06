class ReceiptsController < ApplicationController

 #before_action :set_receipt, only: %i[ show edit update destroy ]
 # before_action :set_receipt, except: [:new, :create, :fetch_bank_details]

 before_action :set_receipt, only: [:show, :edit, :update, :destroy]   
  
  

  def new
    @receipt = Receipt.new    
    
   @receipt_line = ReceiptLine.new
     @banks = Bank.all
    @customers = Customer.all
    @chart_of_accounts = ChartOfAccount.all
    
    @receipt.receipt_lines.build
    load_account_data
    
  end

 


  # GET /receipts or /receipts.json
  def index
    @receipts = Receipt.all
     @banks = Bank.all 
  end

  # GET /receipts/1 or /receipts/1.json
  def show
 @banks = Bank.all 
  
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    @banks = Bank.all
  @receipt.receipt_lines.build
  end

  # GET /receipts/1/edit
  def edit
  @banks = Bank.all
  @receipt.receipt_lines.build if @receipt.receipt_lines.empty?
  end

  # POST /receipts or /receipts.json
  def create
  load_references 
   load_account_data
    @receipt = Receipt.new(receipt_params)
    
    @receipt.received_by = current_user.email 
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
  
  @receipt.received_by = current_user.email 
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
  

  
 
  


  
  
  
  
  

  
  def insert_into_rcgledger01
   @receipt = Receipt.find(params[:id])
   
   receipts = Receipt.where(id: params[:id])
    receipts.each do |receipt|
   
    Gledger.create!(
      description: receipt.receipt_description,
      amount: receipt.amount,  # adjust based on your fields
      documentno: receipt.document_no,
      sourceno: 'c28828',
      sourcetype: 'bank',
      accountno: 'some_account',  # customize as per your gledger structure
      #receipt_id: receipt.id   # assuming there's a reference to the receipt
    )
    
    end
  end
  
  
  
  
  
  
  
  
   def insert_into_rcgledgerC1
   
   
    receipts = Receipt.where(id: params[:id])
    receipts.each do |receipt|
    
      Gledger.create(
      
     date: params[:receipt_date],
     accountno: 'rt556',
     description: 'test trans',
     amount: 5000,
     
      
     )
  end
  end
  
  
  
  
 def insert_into_rcgledger
 
    # Get the payment_id from the form or request params
     
   receipt = Receipt.find(params[:id])
   
 receipts = Receipt.where(id: params[:id])
    receipts.each do |receipt|
        
    Gledger.create!(
     description: receipt.receipt_description,
     amount: -receipt.amount,  # adjust based on your fields
     documentno: receipt.document_no,
     sourceno: receipt.bank_code,
     sourcetype: 'bank',
     date: receipt.receipt_date,
    accountno: receipt.glaccount
      #'some_account',  # customize as per your gledger structure
      #receipt_id: receipt.id   # assuming there's a reference to the receipt
    )
   # @mydate = receipt.receipt_date
  #  @docno = receipt.document_no
    #end
    #end
 
 
 
 
      # receipt_id = params[:id]
     
  
     
   ReceiptLine.where(receipt_id: receipt.id).find_each do |line|
  Gledger.create!(
    documentno: receipt.document_no,
    date: receipt.receipt_date,
    accountno: line.account_no,
    description: line.account_name,
    sourcetype: line.account_type,
    sourceno: line.account_no
  )
end
  
    end

    # Redirect to a relevant path or render a response after the loop
    #redirect_to receipt_path, notice: "receipts posted"
  end 
  
  

  
  
  

 

   

  
 
  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
   
   
  
  def set_receipt
  Rails.logger.debug "Params ID: #{params[:id]}"
  @receipt = Receipt.find(params[:id])
  end

 
   
    
    
 
    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:receipt_date, :bank_code, :description, :received_by, :receipt_by, :receipt_mode, :receipt_description, :status, :document_no, :amount, :received_from, :account_type, :accountno, :glaccount, :posted, receipt_lines_attributes: [:receipt_date, :receipt_account, :account_type, :account_no, :account_name, :amount, :invoiceno, :receipt_id, :_destroy])
end

def find_by_receipt
   @receipt = Receipt.find_by(id: params[:id])
  end
  
 def load_references
    @banks = Bank.all
    @customers = Customer.all
    @chart_of_accounts = ChartOfAccount.all
  end 
    def load_account_data
    @banks = Bank.all
    @customers = Customer.all
    @chart_of_accounts = ChartOfAccount.all
  end
  
  
  
  
end
