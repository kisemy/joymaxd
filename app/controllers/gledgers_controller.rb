class GledgersController < ApplicationController
  before_action :set_gledger, only: %i[ show edit update destroy ]

  #validates :documentno, :description, :amount, presence: true

  # GET /gledgers or /gledgers.json
  def index
    @gledgers = Gledger.all
  end

  # GET /gledgers/1 or /gledgers/1.json
  def show
  end

  # GET /gledgers/new
  def new
    @gledger = Gledger.new
  end

  # GET /gledgers/1/edit
  def edit
  end

  # POST /gledgers or /gledgers.json
  def create
    @gledger = Gledger.new(gledger_params)

    respond_to do |format|
      if @gledger.save
        format.html { redirect_to gledger_url(@gledger), notice: "Gledger was successfully created." }
        format.json { render :show, status: :created, location: @gledger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gledgers/1 or /gledgers/1.json
  def update
    respond_to do |format|
      if @gledger.update(gledger_params)
        format.html { redirect_to gledger_url(@gledger), notice: "Gledger was successfully updated." }
        format.json { render :show, status: :ok, location: @gledger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gledgers/1 or /gledgers/1.json
  def destroy
    @gledger.destroy

    respond_to do |format|
      format.html { redirect_to gledgers_url, notice: "Gledger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gledger
      @gledger = Gledger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gledger_params
      params.require(:gledger).permit(:accountno, :date, :documentno, :description, :amount, :sourcetype, :sourceno)
    end
end
