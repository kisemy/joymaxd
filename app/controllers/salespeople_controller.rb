class SalespeopleController < ApplicationController
  before_action :set_salesperson, only: %i[ show edit update destroy ]

  # GET /salespeople or /salespeople.json
  def index
    @salespeople = Salesperson.all
  end

  # GET /salespeople/1 or /salespeople/1.json
  def show
  @salesperson = Salesperson.find(params[:id])
    respond_to do |format|
      format.json { render json: @salesperson }
    end
  
  end

  # GET /salespeople/new
  def new
    @salesperson = Salesperson.new
  end

  # GET /salespeople/1/edit
  def edit
  end

  # POST /salespeople or /salespeople.json
  def create
    @salesperson = Salesperson.new(salesperson_params)

    respond_to do |format|
      if @salesperson.save
        format.html { redirect_to salesperson_url(@salesperson), notice: "Salesperson was successfully created." }
        format.json { render :show, status: :created, location: @salesperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salesperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salespeople/1 or /salespeople/1.json
  def update
    respond_to do |format|
      if @salesperson.update(salesperson_params)
        format.html { redirect_to salesperson_url(@salesperson), notice: "Salesperson was successfully updated." }
        format.json { render :show, status: :ok, location: @salesperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salesperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salespeople/1 or /salespeople/1.json
  def destroy
    @salesperson.destroy

    respond_to do |format|
      format.html { redirect_to salespeople_url, notice: "Salesperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salesperson
      @salesperson = Salesperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salesperson_params
      params.require(:salesperson).permit(:name, :email, :phone_no, :job_title, :total_sales, :commission)
    end
end
