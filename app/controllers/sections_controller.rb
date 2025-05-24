class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]

  # GET /sections or /sections.json
  def index
    @sections = Section.all
    @departments = Department.all
      Rails.logger.debug @sections.map(&:id).inspect # C 
  end

  # GET /sections/1 or /sections/1.json
  def show
  @departments = Department.all
  end

  # GET /sections/new
  def new
    @section = Section.new
    @departments = Department.all
  end

  # GET /sections/1/edit
  def edit
  @departments = Department.all
  end

  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params)
@departments = Department.all
    respond_to do |format|
      if @section.save
        format.html { redirect_to section_url(@section), notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
  @departments = Department.all
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to section_url(@section), notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url, notice: "Section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end
   #def set_section
 # @section = Section.find_by(section_code: params[:id]) || 
       #      Section.find(params[:id]) # Fallback to ID if needed
#end 
    
    
    

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:section_code, :section_name, :current_co_name, :current_co_telephone, :current_co_email, :general_section_email, :department_code, :department_name, :complete_projects, :projects_in_progress)
    end
end
