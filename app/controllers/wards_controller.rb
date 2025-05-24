class WardsController < ApplicationController
  before_action :set_ward, only: %i[ show edit update destroy ]

  # GET /wards or /wards.json
  def index
   # @wards = Ward.all
     @sub_counties = SubCounty.all
     
  
    @wards = if params[:sub_county_code].present?
               Ward.where(sub_county_code: params[:sub_county_code])
             else
               []
             end

    respond_to do |format|
      format.json { render json: @wards }
    end
   
     
  end

  # GET /wards/1 or /wards/1.json
  def show
   @sub_counties = SubCounty.all
  end

  # GET /wards/new
  def new
    @ward = Ward.new
     @sub_counties = SubCounty.all
  end

  # GET /wards/1/edit
  def edit
   @sub_counties = SubCounty.all
  end

  # POST /wards or /wards.json
  def create
    @ward = Ward.new(ward_params)
 @sub_counties = SubCounty.all
    respond_to do |format|
      if @ward.save
        format.html { redirect_to ward_url(@ward), notice: "Ward was successfully created." }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wards/1 or /wards/1.json
  def update
   @sub_counties = SubCounty.all
    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to ward_url(@ward), notice: "Ward was successfully updated." }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wards/1 or /wards/1.json
  def destroy
    @ward.destroy

    respond_to do |format|
      format.html { redirect_to wards_url, notice: "Ward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      @ward = Ward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ward_params
      params.require(:ward).permit(:ward_code, :ward_name, :ward_admin_pno, :ward_admin_name, :ward_admin_telephone, :ward_admin_email, :sub_county_code, :sub_county_name)
    end
end
