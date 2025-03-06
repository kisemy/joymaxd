class PaymentsController < ApplicationController
  #before_action :set_payment, only: %i[ show edit update destroy ]
  before_action :set_payment,  only: [:edit, :update]
  
  before_action :find_payment,  only: [:show, :edit,  :update, :destroy]

  
   attr_accessor :id
   
   before_action :authenticate_user!

  
   

  # GET /payments or /payments.json
  def index 
  # if current_user.can?('view', 'Payment')
    @payments = Payment.all
    @account_types = AccountType.all
    #else 
    #redirect_to root_path, alert: 'You are not authorized to view payments.'
  # end
  end

  # GET /payments/1 or /payments/1.json
  def show
  @payment = Payment.find(params[:id])
   @account_types = AccountType.all
   
  # respond_to do |format|
    #  format.html
     # format.pdf do
      #  pdf = Prawn::Document.new
      #  pdf.text "Hello, this is a PDF document."
      #  send_data pdf.render, filename: 'document.pdf', type: 'payments/_paymentsttemp', disposition: 'inline'
     # end
   # end
    

   
    @payments = Payment.all # or whatever query you need
        respond_to do |format|
     format.html
      format.pdf do
        render pdf: "Payment No. #{@payment.id}",
        page_size: 'A4',
        template: "payments/_paymenttemp.html.erb",
        layout: "pdf.html.erb",
       orientation: "portrait",
       lowquality: true,
        zoom: 1, 
       dpi: 75
     end
    end
    
     
    
  
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @payment.paymentlines.build
    @banks = Bank.all 
    @account_types = AccountType.all
    
  end

  # GET /payments/1/edit
  def edit
 @payment = Payment.find(params[:id])
 @banks = Bank.all
 @account_types = AccountType.all
  end

  # POST /payments or /payments.json
 # def create
  #  @payment = Payment.new(payment_params)
   # respond_to do |format|
    #  if @payment.save
      #  format.html { redirect_to payment_url(@payment), notice: "Payment was successfully created." }
       # format.json { render :show, status: :created, location: @payment }
     # else
       # format.html { render :new, status: :unprocessable_entity }
       # format.json { render json: @payment.errors, status: :unprocessable_entity }
      # end
   # end
  # end
  
  
  def create
 # if current_user.can?('create','Payment')
  @payment = Payment.new(payment_params)
  logger.debug "Payment Params: #{payment_params.inspect}"

  if @payment.save
    redirect_to @payment, notice: 'Payment was successfully created.'
  else
        redirect_to root_path, alert: 'You are not authorized to create payments.'
    logger.debug "Payment Errors: #{@payment.errors.full_messages}"
    render :new
  #end
end
end



 
  
  
  
  
  
  
  
  
  

  # PATCH/PUT /payments/1 or /payments/1.json
 # def update
  #  respond_to do |format|
    #  if @payment.update(payment_params)
      #  format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
      #  format.json { render :show, status: :ok, location: @payment }
     # else
       # format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @payment.errors, status: :unprocessable_entity }
     # end
   # end
  #end


def update
   if @payment.update(payment_params)
     flash[:notice] = "Updated invoice successfully!"
    # @payment.calculate_product_totals1
      redirect_to payment_path(@payment)
    else
     flash[:alert] = @payment.errors.full_messages.uniq
      render :edit
    end
  end












  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end



def postgl2


@vlines = Paymentline.all

@vlines.each do |vline|
#@vlines = @vlines.joins(:payment).where(payment_id: params[:id])

@product = Gledger.new

@product.accountno = vline.accountno
@product.description =vline.description
@product.documentno =vline.id
@product.sourceno =vline.accountno
@product.sourcetype = vline.account_type

if vline.amount.blank?

 flash[:notice] = "amount is zero!"
  # Do something when the variable is blank
else
@product.amount =vline.amount
  # Do something when the variable is not blank
end


@product.amount =vline.amount

@product.save

end
end

 def fetch_accountno
    account_type = params[:account_type]
    accountno_options = case account_type
                       when 'customer'
                         Customer.pluck(:customer_name)
                       when 'vendor'
                         Vendor.pluck(:accountno)
                       when 'gl_account'
                         GlAccount.pluck(:no)
                       when 'bank'
                         Bank.pluck(:bank_name)
                       when 'fixed_asset'
                         FixedAsset.pluck(:accountno)
                       else
                         []
                       end

    render json: { accountno_options: accountno_options }
  end






def insert_into_gledger
 



    # Get the payment_id from the form or request params
     
     payment_id = params[:id]
     
     Gledger.create(
      
      accountno: payment.accountno,
      amount: payment.amount,
      description: paymentline.description
      #notice: "niko hapa"
      
        #column1: payment_line.some_column,
       # column2: payment_line.other_column,
        #column3: payment_line.another_column
      )
     
     
     

    # Fetch all payment lines that belong to the specified payment_id
   
     paymentlines = Paymentline.where(payment_id: payment_id)
    # Loop through each payment_line and perform the insert into gledger
    paymentlines.each do |paymentline|
      # Assume you're using data from payment_line to insert into gledger
      Gledger.create(
      
      accountno: paymentline.accountno,
      amount: paymentline.amount,
      description: paymentline.description
      #notice: "niko hapa"
      
        #column1: payment_line.some_column,
       # column2: payment_line.other_column,
        #column3: payment_line.another_column
      )
    end

    # Redirect to a relevant path or render a response after the loop
    redirect_to payments_path, notice: "PaymentLines successfully inserted into Gledger."
  end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
       @bank = Bank.all 
        @customer = Customer.all 
    end
    
    
    
    

    # Only allow a list of trusted parameters through.
def payment_params    
  params.require(:payment).permit(:payment_date, :paying_account_code, :paying_acc_description, :prepared_by, :mode_of_payment,:payment_description, 
  :status, :documentno, :release_date, :posted, :amount, :payee_code, :payee_name, :account_type, :category_type,
   paymentlines_attributes: [:id, :paying_account, :account_type, :accountno, :accountname, :amount, :description, :payment_id, :_destroy])
end






   def scope
      ::Payment.all.includes(:paymentlines)
     end
 


def find_payment
   #@payment = Payment.find_by(id: params[:id])
    #@invoice = Invoice.find(params[:id]) 
   @payment = Payment.find(params[:id]) 
  end
end
