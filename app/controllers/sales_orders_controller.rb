class SalesOrdersController < ApplicationController
  before_action :set_sales_order, only: %i[ show edit update destroy ]
    #before_action :set_items, only: [:new, :edit] #

 



  # GET /sales_orders or /sales_orders.json
  def index
    @sales_orders = SalesOrder.all
     @items = Item.all 
   @customers = Customer.all
  end

  # GET /sales_orders/1 or /sales_orders/1.json
  def show
   @items = Item.all 
   @customers = Customer.all
   
   respond_to do |format|
      format.html
      format.pdf do
        render pdf: "sales_order_#{@sales_order.order_no}",
               template: 'sales_orders/show',
               formats: [:html],
               disposition: :inline, # Open in browser instead of downloading
               layout: 'order_pdf', # Optional: Use a custom PDF layout
               disposition: :inline, 
               page_size: 'A4',
               margin: { top: 20, bottom: 20, left: 20, right: 20 }
      end
    end  







   
   
  
  end

  # GET /sales_orders/new
  def new
   @sales_order = SalesOrder.new
   @sales_order.salesorder_lines.build
   @items = Item.all 
   @customers = Customer.all 
  end

  # GET /sales_orders/1/edit
  def edit
   @items = Item.all 
   @customers = Customer.all
  
  end
  
  
  
  
  
  

      

	

  # POST /sales_orders or /sales_orders.json
  def create
   @sales_order = SalesOrder.new(sales_order_params) 
    @sales_order.order_no = generate_order_no
      @customers = Customer.all
   @items = Item.all 
    respond_to do |format|
      if @sales_order.save
        format.html { redirect_to sales_order_url(@sales_order), notice: "Sales order was successfully created." }
        format.json { render :show, status: :created, location: @sales_order }
      else 
     # @customers = Customer.all 
      @items = Item.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  
  
  
  
  
  
  
  
  

  # PATCH/PUT /sales_orders/1 or /sales_orders/1.json
  def update
   @sales_order = SalesOrder.find_by(order_no: params[:sales_order][:order_no])
  
   @items = Item.all
    respond_to do |format|
      if @sales_order.update(sales_order_params)
        format.html { redirect_to sales_order_url(@sales_order), notice: "Sales order was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_order }
      else
       @items = Item.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  
  
  
  
  
  
  

  # DELETE /sales_orders/1 or /sales_orders/1.json
  def destroy
    @sales_order.destroy

    respond_to do |format|
      format.html { redirect_to sales_orders_url, notice: "Sales order was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  
  def get_customer_details
  customer = Customer.find_by(customer_name: params[:customer_name])
  if customer
    render json: {
      customer_no: customer.clientcode,
      contactno: customer.contactno,
      contact_name: customer.contact_name,
      address: customer.address,
      city: customer.city
    }
  else
    render json: { error: 'Customer not found' }, status: 404
  end
end


#post g/l entries

def insert_into_gledger
 
    # Get the payment_id from the form or request params
   #@sales_order = SalesOrder.find(params[:id])  
   sales_order = SalesOrder.find(params[:id])
   
 sales_order = SalesOrder.where(order_no: params[:id])
    sales_order.each do |sales_order|
        
    Gledger.create!(
     description: sales_order.customer_name,
     #amount: -receipt.amount,  # adjust based on your fields
     documentno: sales_order.order_no,
     sourceno: sales_order.order_no,
     #sourcetype: 'bank',
     date: sales_order.order_date,
    accountno: sales_order.order_no
      #'some_account',  # customize as per your gledger structure
      #receipt_id: receipt.id   # assuming there's a reference to the receipt
    )
   # @mydate = receipt.receipt_date
  #  @docno = receipt.document_no
    #end
    #end
 
 
 
 
      # receipt_id = params[:id]
     #ReceiptLine.where(receipt_id: receipt.id).find_each do |line|
 
     
  SalesorderLine.where(order_no: sales_order.order_no).find_each do |line|
  Gledger.create!(
    documentno: sales_order.order_no,
    date: sales_order.order_date,
    accountno: line.item_no,
    description: line.description,
   # sourcetype: line.account_type,
    sourceno: line.item_no,
    amount: line.amount,
  )
end
  
    end

    # Redirect to a relevant path or render a response after the loop
    #redirect_to receipt_path, notice: "receipts posted"
  end 



#@salesorder_lines = SalesorderLine.all




  
  
  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end
    
     def set_items
    @items = Item.all # Or any other query to fetch the items
  end
    
    

    # Only allow a list of trusted parameters through.
    def sales_order_params
      params.require(:sales_order).permit(:order_no, :customer_no, :customer_name, :contactno, :contact_name, :address, :city, :order_date, :sales_person_code, :sales_person_name, salesorder_lines_attributes: [ :charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount, :order_no, :_destroy] )
    end
    
   def generate_order_no
    # Example: Generate a unique order number
    "ORD-#{Time.now.to_i}-#{SecureRandom.hex(4)}"
  end
    
    
end
