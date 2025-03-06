class SalesQuotesController < ApplicationController
  before_action :set_sales_quote, only: %i[ show edit update destroy ]

  # GET /sales_quotes or /sales_quotes.json
  def index
    @sales_quotes = SalesQuote.all
  end

  # GET /sales_quotes/1 or /sales_quotes/1.json
  def show
  end

  # GET /sales_quotes/new
  def new
    @sales_quote = SalesQuote.new
     @customers = Customer.all
  end

  # GET /sales_quotes/1/edit
  def edit
  end

  # POST /sales_quotes or /sales_quotes.json
  def create
    @sales_quote = SalesQuote.new(sales_quote_params)

    respond_to do |format|
      if @sales_quote.save
        format.html { redirect_to sales_quote_url(@sales_quote), notice: "Sales quote was successfully created." }
        format.json { render :show, status: :created, location: @sales_quote }
      else
       @customers = Customer.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_quotes/1 or /sales_quotes/1.json
  def update
    respond_to do |format|
      if @sales_quote.update(sales_quote_params)
        format.html { redirect_to sales_quote_url(@sales_quote), notice: "Sales quote was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_quotes/1 or /sales_quotes/1.json
  def destroy
    @sales_quote.destroy

    respond_to do |format|
      format.html { redirect_to sales_quotes_url, notice: "Sales quote was successfully destroyed." }
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
      render json: { error: 'Customer not found' }, status: :not_found
    end
  end

  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_quote
      @sales_quote = SalesQuote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_quote_params
      params.require(:sales_quote).permit(:QTN_no, :customer_no, :customer_name, :contactno, :contact_name, :address, :city, :quote_date, :sales_person_code, :sales_person_name)
    end
end
