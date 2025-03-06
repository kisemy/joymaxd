class ChargetypesController < ApplicationController
  before_action :set_chargetype, only: %i[ show edit update destroy ]

  # GET /chargetypes or /chargetypes.json
  def index
    @chargetypes = Chargetype.all
  end

  # GET /chargetypes/1 or /chargetypes/1.json
  def show
  end

  # GET /chargetypes/new
  def new
    @chargetype = Chargetype.new
  end

  # GET /chargetypes/1/edit
  def edit
  end

  # POST /chargetypes or /chargetypes.json
  def create
    @chargetype = Chargetype.new(chargetype_params)

    respond_to do |format|
      if @chargetype.save
        format.html { redirect_to chargetype_url(@chargetype), notice: "Chargetype was successfully created." }
        format.json { render :show, status: :created, location: @chargetype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chargetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chargetypes/1 or /chargetypes/1.json
  def update
    respond_to do |format|
      if @chargetype.update(chargetype_params)
        format.html { redirect_to chargetype_url(@chargetype), notice: "Chargetype was successfully updated." }
        format.json { render :show, status: :ok, location: @chargetype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chargetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chargetypes/1 or /chargetypes/1.json
  def destroy
    @chargetype.destroy

    respond_to do |format|
      format.html { redirect_to chargetypes_url, notice: "Chargetype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chargetype
      @chargetype = Chargetype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chargetype_params
      params.require(:chargetype).permit(:code, :charge_description)
    end
end
