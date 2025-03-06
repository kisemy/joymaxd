class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  # render json: Customer.select(:id, :customer_name).map { |c| { id: c.id, name: c.customer_name } }
  end 

  # GET /customers/1 or /customers/1.json
  def show
 
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        html = render_to_string(template: 'customers/show', layout: 'pdf')
        pdf = Grover.new(html).to_pdf
        send_data pdf, filename: "customer_#{@customer.id}.pdf", type: 'application/pdf'
      end
    end
    
    

  
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def account_number
    customer = Customer.find_by(customer_name: params[:customer_name])
    render json: { account_number: customer.try(:account_number) }
  end
  
 
   def find_by_name
    @customer = Customer.find_by(customer_name: params[:customer_name])
    if @customer
      render json: @customer
    else
      render json: { error: 'Customer not found' }, status: :not_found
    end
  end
  
  
  
  
  
  
  

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
   
    
    

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:clientcode, :customer_name, :contactno, :contact_name, :address, :city, :date, :sales_person_code, :sales_person_name)
    end
end
