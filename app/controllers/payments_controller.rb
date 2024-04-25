class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]
  before_action :find_payment, only: [:show, :edit, :update, :destroy]


  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @payment.paymentlines.build
  end

  # GET /payments/1/edit
  def edit
 @invoice = Invoice.find(params[:id])
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
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



def postgl
  # @invoice = Invoice.find(params[:id])
#@invoice = Invoice.find(params["invoice"])
#@invoice = Invoice.find(params[:id])
    # Gledger.create({
               #                   :description => params[:id],
                      #            :documentno => '677',
                           #       :date => Date.today,
                         #     })

#filtered_records = model_a_records.joins(:model_bs).where(your_condition_for_model_b)

@vlines = InvoiceLine.all

#@vhead = Gledger.new
#@vhead = 


#@vlines = Vline.where(voucher_id: params[:id])
#@vlines = @vlines.where(invoice_id: params[:id])
#@vlines = @vlines.joins(:invoice).where(invoice_id: params[:id])



# @things = @things.where(size: params[:size]) 
#@myvlines = @vlines
#@vline.each do |vline|
@vlines.each do |vline|
@vlines = @vlines.joins(:invoice).where(invoice_id: params[:id])

@product = Gledger.new


@product.description =vline.description
@product.documentno =params[:id]

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












  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
def payment_params    
  params.require(:payment).permit(:payment_date, :paying_account_code, :paying_acc_description, :prepared_by, :mode_of_payment,:payment_description, 
  :status, :documentno, :release_date, :posted, :amount, :payee_code, :payee_name, :account_type, :category_type,
   paymentlines_attributes: [:paying_account, :account_type, :accountno, :accountname, :amount, :description, :payment_id, :_destroy])
end


  def scope
      ::Payment.all.includes(:paymentlines)
    end
 


def find_payment
   @payment = Payment.find_by(id: params[:id])
  end
end
