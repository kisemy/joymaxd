class FinancialYearsController < ApplicationController
  before_action :set_financial_year, only: %i[ show edit update destroy ]

  # GET /financial_years or /financial_years.json
  def index
    @financial_years = FinancialYear.all
  end

  # GET /financial_years/1 or /financial_years/1.json
  def show
  end

  # GET /financial_years/new
  def new
    @financial_year = FinancialYear.new
  end

  # GET /financial_years/1/edit
  def edit
  end

  # POST /financial_years or /financial_years.json
  def create
    @financial_year = FinancialYear.new(financial_year_params)

    respond_to do |format|
      if @financial_year.save
        format.html { redirect_to financial_year_url(@financial_year), notice: "Financial year was successfully created." }
        format.json { render :show, status: :created, location: @financial_year }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_years/1 or /financial_years/1.json
  def update
    respond_to do |format|
      if @financial_year.update(financial_year_params)
        format.html { redirect_to financial_year_url(@financial_year), notice: "Financial year was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_year }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_years/1 or /financial_years/1.json
  def destroy
    @financial_year.destroy

    respond_to do |format|
      format.html { redirect_to financial_years_url, notice: "Financial year was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_year
      @financial_year = FinancialYear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_year_params
      params.require(:financial_year).permit(:code, :description)
    end
end
