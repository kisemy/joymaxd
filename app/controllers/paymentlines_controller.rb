class PaymentlinesController < ApplicationController
  before_action :set_paymentline, only: %i[ show edit update destroy ]

  # GET /paymentlines or /paymentlines.json
  def index
    @paymentlines = Paymentline.all
  end

  # GET /paymentlines/1 or /paymentlines/1.json
  def show
  end

  # GET /paymentlines/new
  def new
    @paymentline = Paymentline.new
  end

  # GET /paymentlines/1/edit
  def edit
  end

  # POST /paymentlines or /paymentlines.json
  def create
    @paymentline = Paymentline.new(paymentline_params)

    respond_to do |format|
      if @paymentline.save
        format.html { redirect_to paymentline_url(@paymentline), notice: "Paymentline was successfully created." }
        format.json { render :show, status: :created, location: @paymentline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paymentline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paymentlines/1 or /paymentlines/1.json
  def update
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
