class BankgroupsController < ApplicationController
  before_action :set_bankgroup, only: %i[ show edit update destroy ]

  # GET /bankgroups or /bankgroups.json
  def index
   # @bankgroups = Bankgroup.all
    
     @bankgroups = Bankgroup.includes(:chart_of_account)
  end

  # GET /bankgroups/1 or /bankgroups/1.json
  def show
  end

  # GET /bankgroups/new
  def new
    @bankgroup = Bankgroup.new
  end

  # GET /bankgroups/1/edit
  def edit
  end

  # POST /bankgroups or /bankgroups.json
  def create
    @bankgroup = Bankgroup.new(bankgroup_params)

    respond_to do |format|
      if @bankgroup.save
        format.html { redirect_to bankgroup_url(@bankgroup), notice: "Bankgroup was successfully created." }
        format.json { render :show, status: :created, location: @bankgroup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bankgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bankgroups/1 or /bankgroups/1.json
  def update
    respond_to do |format|
      if @bankgroup.update(bankgroup_params)
        format.html { redirect_to bankgroup_url(@bankgroup), notice: "Bankgroup was successfully updated." }
        format.json { render :show, status: :ok, location: @bankgroup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bankgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bankgroups/1 or /bankgroups/1.json
  def destroy
    @bankgroup.destroy

    respond_to do |format|
      format.html { redirect_to bankgroups_url, notice: "Bankgroup was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  
  def get_glaccount
    bankgroup = Bankgroup.find_by(code: params[:code])
  # bankgroup = Bankgroup.find_by(code: params[:code])
    if bankgroup
      render json: { glaccount: bankgroup.gl_account }
    else
      render json: { glaccount: '455' }, status: :not_found
    end
  end

  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bankgroup
      @bankgroup = Bankgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bankgroup_params
      params.require(:bankgroup).permit(:code, :description, :gl_account)
    end
end
