class InvoicesController < ApplicationController

  #before_action :set_invoice, :postgl, only: %i[ show edit update destroy postgl ]

  before_action :set_invoice, only: %i[ show edit update destroy ]
  #before_action :find_invoice,:postgl, only: [:show, :edit, :destroy]
  #attr_accessor :id, :customer_name, :contactno, :contact_name, :address, :city, :date, :sales_person_code, :sales_person_name

  
  # GET /invoices or /invoices.json
  def index
 
    @invoices = Invoice.all
     @invoices = scope
  end



￼
  # GET /invoices/1 or /invoices/1.json
  

  def show
@invoice = Invoice.find(params[:id])

 #@invoice = Invoice.find(params[:id])
#  @invoice = scope.find(params[:id])
  # @invoice.invoice_lines.buildecord::RecordNotFound in InvoicesController#postgl

   # respond_to do |format|
    #  format.html
      #format.pdf do
     #   render pdf: "Invoice No. #{@invoice.id}", @invoice = Invoice.find(params[:id])
      #  page_size: 'A4',
       # template: "invoices/show.html.erb",
       # layout: "pdf.html.erb",
      #  orientation: "portrait",
     #   lowquality: true,
       # zoom: 1, @invoice = scope.find(params[:id])
      #  dpi: 75
   #   end
    #end
end




  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_lines.build
  end



 #def editvoices/19/edit
 #end voices/19/edit

 def edit
 #@invoices = Invoice.all
 @invoice = Invoice.find(params[:id])
  end


  # GET /invoices/1/edit 
  
  # POST /invoices or /invoices.json
   def create
      @invoice = Invoice.new(invoice_params)stgl?id=23

     respond_to do |format|
       if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully created." }
         format.json { render :show, status: :created, location: @invoice }
       else
        format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
     end
 end

 end

# def create
  #   @invoice = invoices.build(invoice_params)
   #  invoice_params[:invoice_lines_attributes].each do |num,product|:customer_name, :contactno, :contact_name, :address, :city, :date, :sales_person_code, :sales_person_name
    #   @invoice.invoice_lines.build(product)
   
# end 
 #  invoices/19/editvoices/19/edit
       ##flash[:a@vrs = Invoice@invoice = scope.find(params[:id]).find(params[:id])  lert] = @invoice.errors.full_messages.uniq
      # #render :new


  #  if @invoice.valid?
    #   @invoice.save
     
     #  flash[:notice] = "Invoice created successfully!"
      # redirect_to invoice @invoice = Invoice.find_by(id: params[:id])_path(@invoice, @invoice)
   #  else
     #  flash[:alert] = @invoice.errors.full_messages.uniq
     #  render :new
    # end
    
 # endvoices/19/edit

  # PATCH/PUT /invoices/1 or /invoices/1.json
 # def update
    # respond_to do |format|
     #  if @invoice.update(invoice_params)
        # format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated." }
       #  format.json { render :show, status: :ok, location: @invoice }
      # else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @invoice.errors, status: :unprocessable_entity }
      # end
    # end
 # end


	def update
	    respond_to do |format|
              @invoice = Invoice.find(params[:id])
	      if @invoice.update(invoice_params)
		format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated." }
		format.json { render :show, status: :ok, location: @invoice }
	      else
		format.html { render :edit, status: :unprocessable_entity }
		format.json { render json: @invoice.errors, status: :unprocessable_entity }
	      end
	    end
	  end




# def update
   #if @invoice.update(invoice_params)
    # flash[:notice] = "Updated invoice successfully!"
    # @invoice.calculate_product_totals
    #  redirect_to invoice_path(@invoice)
   # else
    # flash[:alert] = @invoice.errors.full_messages.uniq
     # render :edit
   # end
 # end





#end
 

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_field
    respond_to do |format|
      format.js {render layout: false}
    end
  end



#def postgl
  # @invoice = Invoice.find(params[:id])
#@invoice = Invoice.find(params["invoice"])
#@invoice = Invoice.find(params[:id])
    # Gledger.create({
               #                   :description => params[:id],
                      #            :documentno => '677',
                           #       :date => Date.today,
                         #     })



#@vlines = InvoiceLine.all
#@vlines = Vline.where(voucher_id: params[:id])
#@vlines = @vlines.where(invoice_id: params[:id])
# @things = @things.where(size: params[:size]) 
#@myvlines = @vlines
#@vline.each do |vline|
#@vlines.each do |vline|


#@product = Gledger.new
#@product.description =vline.description
#@product.documentno =params[:id]
#@product.amount =vline.amount
#@product.save

#end







#end


 #def interested2 

 
 #@product = Genledger.new
 #@product.description =params[:description]  
 #@product.documentNo =params[:payee] 
 #@product.postingdate =params[:paymentdate] 

 #@product.amount = params[:amount]
   #@product.save

 #end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
       @invoice = Invoice.find(params[:id])




    end

    # Only allow a list of trusted parameters through.
  def invoice_params1
   params.require(:invoice).permit(:customer_name, :contactno, :contact_name, :address, :city, :date, :sales_person_code, :sales_person_name,     invoice_lines_attributes: [:charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount, :_destroy])
  end

   def scope
      ::Invoice.all.includes(:invoice_lines)
    end

def find_invoice
  #@invoice = Invoice.find(params[:id])
   # @invoice = Invoice.find_by(id: params[:id])
  end






end

