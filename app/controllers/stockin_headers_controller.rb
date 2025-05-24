class StockinHeadersController < ApplicationController
  before_action :set_stockin_header, only: %i[ show edit update destroy ]


  before_action :set_stockin_header, only: [:show, :edit, :update, :destroy]

  # GET /stockin_headers or /stockin_headers.json
  def index
    @stockin_headers = StockinHeader.all
    @items = Item.all 
   @customers = Customer.all
   @suppliers = Supplier.all
  end

 # GET /stockin_headers/1 or /stockin_headers/1.json
  def show
  @stockin_headers = StockinHeader.all

  #@stockin_header = StockinHeader.find(params[:id]) # or find_by(id: params[:id])
   @items = Item.all 
   @customers = Customer.all
  @suppliers = Supplier.all
  end
  # GET /stockin_headers/new
  def new
    @stockin_header = StockinHeader.new
  
    @items = Item.all 
   @customers = Customer.all
    @suppliers = Supplier.all
  #@stockin_header.generate_stk_no
  

  end

 

  # GET /stockin_headers/1/edit
  def edit
  @items = Item.all 
   @customers = Customer.all
  @suppliers = Supplier.all
 

  
  end

  # POST /stockin_headers or /stockin_headers.json
  def create
  @suppliers = Supplier.all # or 
    @stockin_header = StockinHeader.new(stockin_header_params)
    
     if StockinHeader.exists?(stk_no: @stockin_header.stk_no)
    @stockin_header.generate_stk_no
  end
  

  
  
  
  
  
  
  
  
  
  
  
    
 @items = Item.all 
   @customers = Customer.all
    respond_to do |format|
      if @stockin_header.save
        format.html { redirect_to stockin_header_url(@stockin_header), notice: "Stockin header was successfully created." }
        format.json { render :show, status: :created, location: @stockin_header }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stockin_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockin_headers/1 or /stockin_headers/1.json
  def update
   @items = Item.all 
   @customers = Customer.all
   @suppliers = Supplier.all
    respond_to do |format|
      if @stockin_header.update(stockin_header_params)
        format.html { redirect_to stockin_header_url(@stockin_header), notice: "Stockin header was successfully updated." }
        format.json { render :show, status: :ok, location: @stockin_header }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stockin_header.errors, status: :unprocessable_entity }
      end
    end
  end
 

  # DELETE /stockin_headers/1 or /stockin_headers/1.json
  def destroy
    @stockin_header.destroy

    respond_to do |format|
      format.html { redirect_to stockin_headers_url, notice: "Stockin header was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def insert_into_gledger2
  
  
  end
  
def process_stockin
    @stockin_header = StockinHeader.find(params[:id])
    
    unless @stockin_header.posted?
      # Execute ledger insertion
      insert_into_ledger(@stockin_header)
      
      # Mark as posted
      @stockin_header.update(posted: true)
      
      redirect_to @stockin_header, notice: 'Stock-in successfully posted to ledger.'
    else
      redirect_to @stockin_header, alert: 'This stock-in has already been posted.'
    end
  end
  
  
  
  
  
  
  
  
  


  

  
  
    def get_supplier
    supplier = Supplier.find_by("LOWER(supplier_name) = ?", params[:supplier_name].to_s.downcase)
   
    if supplier
      render json: {
        supplier_code: supplier.s_no,
        supplier_name: supplier.supplier_name,
        supplier_address: supplier.address,
        telephone: supplier.telephone,
        supplier_email: supplier.email,
        source_codea: supplier.posting_group,
      }, status: :ok
    else
      render json: { 
        error: "Supplier not found with name: #{params[:supplier_name]}" 
      }, status: :not_found
    end
  end

  
  
  
  
  
  
  








  def get_supplier_details3
    supplier = Supplier.find_by(supplier_name: params[:supplier_name])
    
    if supplier
      render json: {
        supplier_code: supplier.s_no,
        supplier_name: supplier.supplier_name,
        supplier_address: supplier.address,
        telephone: supplier.telephone,
        supplier_email: supplier.email,
        source_code: supplier.email,
        source_code: supplier.s_no
      }
    else
      render json: { error: "Supplier not found" }, status: :not_found
    end
  end
  
  
  
  
  
  

  private
  
  def insert_into_ledger(stockin_header)   

 @stockin_headers = StockinHeader.all
    # Get the payment_id from the form or request params
  stockin_header = StockinHeader.find_by(stk_no: params[:stk_no])   
   #receipt = Receipt.find(params[:id])
   
 #receipts = Receipt.where(id: params[:id])
 #stockin_headers = StockinHeader.where(stk_no: params[:id])   
 #stockin_headers = StockinHeader.find_by!(stk_no: params[:id])
 #stockin_headers.each |stockin_header|
 stockin_headers = StockinHeader.where(stk_no: params[:id])
stockin_headers.each do |stockin_header|
    #receipts.each do |receipt|
      total_amount = Stockline.where(stk_no: stockin_header.stk_no).sum(:amount)   
    Gledger.create!(
     description: stockin_header.supplier_name,
     #total_amount = Stockline.where(stk_no: stockin_header.stk_no).sum(:amount)
     amount: -total_amount,  
     accountno:  stockin_header.source_code,
     documentno: stockin_header.stk_no,
     sourceno: stockin_header.supplier_code,
     sourcetype: 'vendor',
     date: stockin_header.received_date
    
      #'some_account',  # customize as per your gledger structure
      #receipt_id: receipt.id   # assuming there's a reference to the receipt
    )
   
 
 
 
 
      # receipt_id = params[:id]
     
  
     
   Stockline.where(stk_no: stockin_header.stk_no).find_each do |line|
  Gledger.create!(
    documentno: stockin_header.stk_no,
    date: stockin_header.received_date,
    amount: line.amount,
    accountno: line.inventory_account,
    description: line.product_description,
    #sourcetype: line.account_type,
    #sourceno: line.account_no
  )
end

end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    # Use callbacks to share common setup or constraints between actions.
   #def set_stockin_header
     # @stockin_header = StockinHeader.find_by(stk_no: params[:id])
    #end
    
    #def set_stockin_header
   # @stockin_header = StockinHeader.find(params[:id])
  #end
    
    
    
  #def set_stockin_header
  # @stockin_header = StockinHeader.find_by(stk_no: params[:stk_no] || params[:id])
  # redirect_to some_path, alert: 'Stockin header not found' unless @stockin_header
#end

#def set_stockin_header
   # @stockin_header = StockinHeader.find_by(stk_no: params[:stk_no] || params[:id])
   # unless @stockin_header
     # redirect_to stockin_headers_path, alert: 'Stockin header not found'
    #end
 # end

#def set_stockin_header
  #  @stockin_header = StockinHeader.find_by(stk_no: params[:stk_no] || params[:id])
    #redirect_to stockin_headers_path, alert: 'Record not found' unless @stockin_header
 # end
  
#def set_stockin_header
  #  @stockin_header = StockinHeader.find_by!(stk_no: params[:stk_no] || params[:id])
  #rescue ActiveRecord::RecordNotFound
    #redirect_to stockin_headers_path, alert: 'Stockin header not found'
  #end
  
def set_stockin_header
    @stockin_header = StockinHeader.find_by(stk_no: params[:stk_no])
    return if @stockin_header
    
    redirect_to stockin_headers_path, 
                alert: "Stockin header with code #{params[:stk_no]} not found"
  end  
  
  
  


    

    # Only allow a list of trusted parameters through.
 def stockin_header_params  

params.require(:stockin_header).permit(:stk_no, :invoice_no, :received_date, :supplier_code, :supplier_name, :supplier_address, :supplier_email, :telephone, :donor, :donor_name, :project_code, :project_name, :warehouse_location_code, :warehouse_location_name, :source_code, :source_name, :source_address, :source_email, :source_telephone, :source_type, :PO_no, :received_by, :received, :posted,  stocklines_attributes: [:stk_no, :code, :product_description, :quantity, :unit_cost, :unit_price, :amount, :received, :expiry_date, :batch_no, :product_category, :date, :unit_of_measure, :warehouse_code, :warehouse_name, :quantity_expected, :quality_check, :comment, :ref_no, :_destroy])
 end
   
 # def generate_stk_no
    # Example: Generate a unique order number
    #"ORD-#{Time.now.to_i}-#{SecureRandom.hex(2)}"
  #end  
  
   
end

 
