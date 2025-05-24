class SubSectionsController < ApplicationController
  before_action :set_sub_section, only: %i[ show edit update destroy ]

  # GET /sub_sections or /sub_sections.json
  def index
    @sub_sections = SubSection.all
    @departments = Department.all
    @sections = Section.all
  end

  # GET /sub_sections/1 or /sub_sections/1.json
  def show
  @sections = Section.all
  end

  # GET /sub_sections/new
  def new
    @sub_section = SubSection.new
    @departments = Department.all
    @sections = Section.all
  end

  # GET /sub_sections/1/edit
  def edit
  @departments = Department.all
  @sections = Section.all
  end

  # POST /sub_sections or /sub_sections.json
  def create
    @sub_section = SubSection.new(sub_section_params)
@departments = Department.all
@sections = Section.all
    respond_to do |format|
      if @sub_section.save
        format.html { redirect_to sub_section_url(@sub_section), notice: "Sub section was successfully created." }
        format.json { render :show, status: :created, location: @sub_section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_sections/1 or /sub_sections/1.json
  def update
  @departments = Department.all
  @sections = Section.all
    respond_to do |format|
      if @sub_section.update(sub_section_params)
        format.html { redirect_to sub_section_url(@sub_section), notice: "Sub section was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_sections/1 or /sub_sections/1.json
  def destroy
    @sub_section.destroy

    respond_to do |format|
      format.html { redirect_to sub_sections_url, notice: "Sub section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_section
      @sub_section = SubSection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_section_params
      params.require(:sub_section).permit(:sub_section_code, :sub_section_name, :sub_section_name, :section_code, :section_name, :department_code, :department_name, :complete_projects, :projects_in_progress)
    end
end


