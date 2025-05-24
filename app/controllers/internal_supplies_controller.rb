class InternalSuppliesController < ApplicationController
  before_action :set_internal_supply, only: %i[ show edit update destroy ]

  # GET /internal_supplies or /internal_supplies.json
  def index
    @internal_supplies = InternalSupply.all
  end

  # GET /internal_supplies/1 or /internal_supplies/1.json
  def show
  end

  # GET /internal_supplies/new
  def new
    @internal_supply = InternalSupply.new
  end

  # GET /internal_supplies/1/edit
  def edit
  end

  # POST /internal_supplies or /internal_supplies.json
  def create
    @internal_supply = InternalSupply.new(internal_supply_params)

    respond_to do |format|
      if @internal_supply.save
        format.html { redirect_to internal_supply_url(@internal_supply), notice: "Internal supply was successfully created." }
        format.json { render :show, status: :created, location: @internal_supply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internal_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_supplies/1 or /internal_supplies/1.json
  def update
    respond_to do |format|
      if @internal_supply.update(internal_supply_params)
        format.html { redirect_to internal_supply_url(@internal_supply), notice: "Internal supply was successfully updated." }
        format.json { render :show, status: :ok, location: @internal_supply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internal_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_supplies/1 or /internal_supplies/1.json
  def destroy
    @internal_supply.destroy

    respond_to do |format|
      format.html { redirect_to internal_supplies_url, notice: "Internal supply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_supply
      @internal_supply = InternalSupply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internal_supply_params
      params.require(:internal_supply).permit(:supplier_name)
    end
end
