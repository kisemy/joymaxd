class AcchartsController < ApplicationController
  before_action :set_acchart, only: %i[ show edit update destroy ]

  # GET /accharts or /accharts.json
  def index
    @accharts = Acchart.all
  end

  # GET /accharts/1 or /accharts/1.json
  def show
  end

  # GET /accharts/new
  def new
    @acchart = Acchart.new
  end

  # GET /accharts/1/edit
  def edit
  end

  # POST /accharts or /accharts.json
  def create
    @acchart = Acchart.new(acchart_params)

    respond_to do |format|
      if @acchart.save
        format.html { redirect_to acchart_url(@acchart), notice: "Acchart was successfully created." }
        format.json { render :show, status: :created, location: @acchart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @acchart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accharts/1 or /accharts/1.json
  def update
    respond_to do |format|
      if @acchart.update(acchart_params)
        format.html { redirect_to acchart_url(@acchart), notice: "Acchart was successfully updated." }
        format.json { render :show, status: :ok, location: @acchart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @acchart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accharts/1 or /accharts/1.json
  def destroy
    @acchart.destroy

    respond_to do |format|
      format.html { redirect_to accharts_url, notice: "Acchart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acchart
      @acchart = Acchart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def acchart_params
      params.require(:acchart).permit(:acc_name, :acctype, :category, :accclass, :balance)
    end
end
