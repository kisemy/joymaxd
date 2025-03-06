class SalesOrdersController < ApplicationController
  before_action :set_sales_order, only: %i[ show edit update destroy ]

  # GET /sales_orders or /sales_orders.json
  def index
    @sales_orders = SalesOrder.all
  end

  # GET /sales_orders/1 or /sales_orders/1.json
  def show
  end

  # GET /sales_orders/new
  def new
    @sales_order = SalesOrder.new
  end

  # GET /sales_orders/1/edit
  def edit
  end

  # POST /sales_orders or /sales_orders.json
  def create
    @sales_order = SalesOrder.new(sales_order_params)

    respond_to do |format|
      if @sales_order.save
        format.html { redirect_to sales_order_url(@sales_order), notice: "Sales order was successfully created." }
        format.json { render :show, status: :created, location: @sales_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_orders/1 or /sales_orders/1.json
  def update
    respond_to do |format|
      if @sales_order.update(sales_order_params)
        format.html { redirect_to sales_order_url(@sales_order), notice: "Sales order was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_order }
      else
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
  
  
  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_order_params
      params.require(:sales_order).permit(:order_no, :customer_no, :customer_name, :contactno, :contact_name, :address, :city, :order_date, :sales_person_code, :sales_person_name)
    end
end
