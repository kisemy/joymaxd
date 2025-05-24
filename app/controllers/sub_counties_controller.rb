class SubCountiesController < ApplicationController
  before_action :set_sub_county, only: %i[ show edit update destroy ]

  # GET /sub_counties or /sub_counties.json
  def index
    @sub_counties = SubCounty.all
  end

  # GET /sub_counties/1 or /sub_counties/1.json
  def show
  end

  # GET /sub_counties/new
  def new
    @sub_county = SubCounty.new
  end

  # GET /sub_counties/1/edit
  def edit
  end

  # POST /sub_counties or /sub_counties.json
  def create
    @sub_county = SubCounty.new(sub_county_params)

    respond_to do |format|
      if @sub_county.save
        format.html { redirect_to sub_county_url(@sub_county), notice: "Sub county was successfully created." }
        format.json { render :show, status: :created, location: @sub_county }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_county.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_counties/1 or /sub_counties/1.json
  def update
    respond_to do |format|
      if @sub_county.update(sub_county_params)
        format.html { redirect_to sub_county_url(@sub_county), notice: "Sub county was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_county }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_county.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_counties/1 or /sub_counties/1.json
  def destroy
    @sub_county.destroy

    respond_to do |format|
      format.html { redirect_to sub_counties_url, notice: "Sub county was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_county
      @sub_county = SubCounty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_county_params
      params.require(:sub_county).permit(:sub_county_code, :sub_county_name)
    end
end
