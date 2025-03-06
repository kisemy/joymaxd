class BanksController < ApplicationController
  before_action :set_bank, only: %i[ show edit update destroy ]

  # GET /banks or /banks.json
  def index
    @banks = Bank.all
   
    render json: Bank.select(:id, :bank_name).map { |b| { id: b.id, name: b.bank_name } }


  end

  # GET /banks/1 or /banks/1.json
  def show
  bank = Bank.find(params[:id])
   
  
  
  end

  # GET /banks/new
  def new
    @bank = Bank.new
   
  end

  # GET /banks/1/edit
  def edit
  
  end
  
  
  
  
  

  # POST /banks or /banks.json
  def create
    @bank = Bank.new(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to bank_url(@bank), notice: "Bank was successfully created." }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banks/1 or /banks/1.json
  #def update
    #respond_to do |format|
    #  if @bank.update(bank_params)
      #  format.html { redirect_to bank_url(@bank), notice: "Bank was successfully updated." }
     #   format.json { render :show, status: :ok, location: @bank }
     # else
       # format.html { render :edit, status: :unprocessable_entity }
       # format.json { render json: @bank.errors, status: :unprocessable_entity }
     # end
   # end
  #end
  
  def update
    @bank = Bank.find(params[:id])

    if @bank.update(bank_params)
      redirect_to @bank, notice: 'Bank was successfully updated.'
    else
      render :edit
    end
  end
  
  
  def account_number
    bank = Bank.find_by(bank_name: params[:bank_name])
    render json: { account_number: bank.try(:account_number) }
  end
  
  
  
  
  

  # DELETE /banks/1 or /banks/1.json
  def destroy
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to banks_url, notice: "Bank was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  def get_bankglaccount
    bank = Bank.all
    #find_by(bank_code: params[:bank_name])
 
    if bank
      render json: { glaccount: bank.glaccount }
    else
      render json: { glaccount: '455' }, status: :not_found
    end
  end
  

  
  
  
  
  #def get_bankglaccount
   # bank = Bank.find_by(bank_name: params[:bank_name])
    #if bank
      #render json: { glaccount: bank.glaccount, description: bank.description }    #else
      #render json: { error: 'Bank not found' }, status: 404
   # end
  #end
  
  
 
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.description
    def bank_params
      params.require(:bank).permit(:bank_name, :bank_acc_no, :posting_group, :glaccount, :description, :balance)
    end
end
