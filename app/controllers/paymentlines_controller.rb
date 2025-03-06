class PaymentlinesController < ApplicationController
  before_action :set_paymentline, only: %i[ show edit update destroy ]

  # GET /paymentlines or /paymentlines.json
  def index
    @paymentlines = Paymentline.all
    @account_types = AccountType.all
  end

  # GET /paymentlines/1 or /paymentlines/1.json
  def show
  @account_types = AccountType.all
  end

  # GET /paymentlines/new
  def new
    @paymentline = Paymentline.new
    @account_types = AccountType.all
  end

  # GET /paymentlines/1/edit
  def edit
  @account_types = AccountType.all
  end

  # POST /paymentlines or /paymentlines.json
  # def create
#   @account_types = AccountType.all
  #   @paymentline = Paymentline.new(paymentline_params)
    
 #    respond_to do |format|
  #     if @paymentline.save
  #       format.html { redirect_to paymentline_url(@paymentline), notice: "Paymentline was successfully created." }
  #       format.json { render :show, status: :created, location: @paymentline }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @paymentline.errors, status: :unprocessable_entity }
  #     end
  #   end
#   end
  
  def create
  paymentline_params = params.require(:paymentline).permit(:paying_account, :account_type, :accountno)
  
  case paymentline_params[:account_type]
  when "customer"
    customer = Customer.find_by(name: paymentline_params[:paying_account])
    paymentline_params[:accountno] = customer.account_no if customer
  when "bank"
    bank = Bank.find_by(name: paymentline_params[:paying_account])
    paymentline_params[:accountno] = bank.account_no if bank
  when "g/l account"
    gl_account = ChartOfAccount.find_by(name: paymentline_params[:paying_account])
    paymentline_params[:accountno] = gl_account.account_no if gl_account
  end

  @paymentline = Paymentline.new(paymentline_params)

  if @paymentline.save
    redirect_to @paymentline, notice: 'Paymentline was successfully created.'
  else
    render :new, status: :unprocessable_entity
  end
end

  
  
  
  
  
  
  
  
  
  

  # PATCH/PUT /paymentlines/1 or /paymentlines/1.json
  def update
  @account_types = AccountType.all
    respond_to do |format|
      if @paymentline.update(paymentline_params)
        format.html { redirect_to paymentline_url(@paymentline), notice: "Paymentline was successfully updated." }
        format.json { render :show, status: :ok, location: @paymentline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paymentline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paymentlines/1 or /paymentlines/1.json
  def destroy
    @paymentline.destroy

    respond_to do |format|
      format.html { redirect_to paymentlines_url, notice: "Paymentline was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
 def fetch_account_number
  account_type = params[:account_type]
  account_name = params[:account_name]
  account_no = nil

  case account_type
  when "customer"
    customer = Customer.find_by(name: account_name)
    account_no = customer&.account_no
  when "bank"
    bank = Bank.find_by(name: account_name)
    account_no = bank&.account_no
  when "g/l account"
    gl_account = ChartOfAccount.find_by(name: account_name)
    account_no = gl_account&.account_no
  end

  render json: { accountno: account_no }
end

  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paymentline
      @paymentline = Paymentline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paymentline_params
      params.require(:paymentline).permit(:paying_account, :account_type, :accountno, :accountname, :amount, :description, :payment_id)
    end
end
