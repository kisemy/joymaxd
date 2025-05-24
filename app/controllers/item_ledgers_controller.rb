class ItemLedgersController < ApplicationController
  before_action :set_item_ledger, only: %i[ show edit update destroy ]

  # GET /item_ledgers or /item_ledgers.json
  def index
    @item_ledgers = ItemLedger.all
  end

  # GET /item_ledgers/1 or /item_ledgers/1.json
  def show
  end

  # GET /item_ledgers/new
  def new
    @item_ledger = ItemLedger.new
  end

  # GET /item_ledgers/1/edit
  def edit
  end

  # POST /item_ledgers or /item_ledgers.json
  def create
    @item_ledger = ItemLedger.new(item_ledger_params)

    respond_to do |format|
      if @item_ledger.save
        format.html { redirect_to item_ledger_url(@item_ledger), notice: "Item ledger was successfully created." }
        format.json { render :show, status: :created, location: @item_ledger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_ledgers/1 or /item_ledgers/1.json
  def update
    respond_to do |format|
      if @item_ledger.update(item_ledger_params)
        format.html { redirect_to item_ledger_url(@item_ledger), notice: "Item ledger was successfully updated." }
        format.json { render :show, status: :ok, location: @item_ledger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_ledgers/1 or /item_ledgers/1.json
  def destroy
    @item_ledger.destroy

    respond_to do |format|
      format.html { redirect_to item_ledgers_url, notice: "Item ledger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_ledger
      @item_ledger = ItemLedger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_ledger_params
      params.require(:item_ledger).permit(:item_no, :posting_date, :document_no, :source_no, :description, :quantity)
    end
end
