class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @sections = Section.all
    @sub_counties = SubCounty.all
   # @project.department_code = params[:department_code] # or however you set this
 # @programmes = Programme.where(department_code: @project.department_code)
  #  @projects = Project.find(params[:id])
  #@programmes = Programme.where(department_code: @project.department_code)

@projects = Project.all.order(:project_name)
  
  # Apply general search (across all fields)
  if params[:general_search].present?
    @projects = @projects.where(
      "project_no ILIKE :search OR 
      project_name ILIKE :search OR 
      financial_year ILIKE :search OR 
      brief_description ILIKE :search OR 
      department ILIKE :search OR 
      department_code ILIKE :search OR 
      programme_name ILIKE :search OR 
      programme_code ILIKE :search OR 
      project_status ILIKE :search OR 
      sub_county_code ILIKE :search OR 
      sub_county ILIKE :search OR 
      ward ILIKE :search OR 
      village ILIKE :search",
      search: "%#{params[:general_search]}%"
    )
  end

  # Apply field-specific filters (combined with AND conditions)
  @projects = @projects.where("project_no ILIKE ?", "%#{params[:project_no]}%") if params[:project_no].present?
  @projects = @projects.where("project_name ILIKE ?", "%#{params[:project_name]}%") if params[:project_name].present?
  @projects = @projects.where("financial_year ILIKE ?", "%#{params[:financial_year]}%") if params[:financial_year].present?
  @projects = @projects.where("department ILIKE ?", "%#{params[:department]}%") if params[:department].present?
  @projects = @projects.where(project_status: params[:project_status]) if params[:project_status].present?
  @projects = @projects.where("sub_county ILIKE ?", "%#{params[:sub_county]}%") if params[:sub_county].present?
  
  #respond_to do |format|
    #format.html
   # format.json { render json: @projects }
  #end 
  
   respond_to do |format|
    format.html
    format.json { render json: @projects }
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename=\"projects-#{Date.today}.xlsx\""
    }
    
    
  #@projects = Project.order(:project_no).paginate(page: params[:page], per_page: params[:per_page] || 25)  
  # @projects = Project.order(:project_no).paginate(page: params[:page], per_page: params[:per_page] || 25) 
  
 # per_page = params[:per_page] == 'all' ? Project.count : (params[:per_page] || 25)
  #@projects = Project.order(:project_no).page(params[:page]).per(per_page)
  
  
  #if params[:per_page] == 'all'
   # @projects = Project.order(:project_no).all
 # else
  #  @projects = Project.order(:project_no).page(params[:page]).per(params[:per_page] || 25)
  #end
  
  @projects = Project.order(:project_no).paginate(page: params[:page], per_page: params[:per_page] || 25)
  

   
    
  end
  
  
  
  
  
  
 #export to excel 
  
  if params[:general_search].present?
    @projects = @projects.where(
      "project_no ILIKE :search OR project_name ILIKE :search OR ...",
      search: "%#{params[:general_search]}%"
    )
  end
  
  @projects = @projects.where("project_no ILIKE ?", "%#{params[:project_no]}%") if params[:project_no].present?
  # ... other filters ...

  respond_to do |format|
    format.html
    format.xlsx do
      response.headers['Content-Disposition'] = "attachment; filename=\"projects-#{Date.today}.xlsx\""
    end
  end
  
  
  
  
  
    
    
    
  end
  
  ##def show
 # @project = Project.includes(:project_tasks).find_by!(project_no: params[:project_no])
  #@project.update_percent_completed! if @project.project_tasks.any?
 # @project_tasks = ProjectTask.where(project_no: params[:project_no])
    ##@project = Project.includes(:project_tasks).find_by!(project_no: params[:project_no])
  #@project_tasks = @project.project_tasks.to_a # Convert to array to avoid nil
  #@project.update_percent_completed! if @project.project_tasks.any?
  
  #@time_span_months = @project_tasks.any? ? ((@project_tasks.maximum(:planned_end_date) - @project_tasks.minimum(:planned_start_date)).to_i / 30) : 1
#end

#def show
  #@project = Project.find_by(project_no: params[:project_no])
 # @project_tasks = @project.project_tasks # This should be an ActiveRecord relation
  
#  @project.update_percent_completed! if @project.project_tasks.any?
  
  ## Calculate time span in months
 # @time_span_months = if @project_tasks.any?
  #  end_date = @project_tasks.maximum(:planned_end_date)
   # start_date = @project_tasks.minimum(:planned_start_date)
   # ((end_date - start_date).to_i / 30)
 # else
 #   1
#  end
#end


def show
@sections = Section.all
  @project = Project.find(params[:id])
  @project_tasks = @project.tasks
    .where.not(planned_start_date: nil, planned_end_date: nil)
    .order(:planned_start_date)
  
  # Calculate chart height based on number of tasks
  @chart_height = [@project_tasks.count * 40, 600].max
  
  # Calculate timespan for viewport adjustment
  if @project_tasks.any?
    start_date = @project_tasks.minimum(:planned_start_date)
    end_date = @project_tasks.maximum(:planned_end_date)
    @time_span_months = ((end_date - start_date).to_i / 30.0).ceil
  else
    @time_span_months = 6 # Default if no tasks
  end
end



  
  
  

  # GET /projects/1 or /projects/1.json
   #def show
    
    #@project = Project.includes(:project_tasks).find_by!(project_no: params[:id])
 # @project.update_percent_completed! if @project.project_tasks.any?
    
    
    
     # @project_tasks = ProjectTask.where(project_no: params[:id])
   # @chart_height = [@project_tasks.count * 40 + 100, 400].max
    #  @project = Project.includes(:project_tasks).find(params[:id])
    # @chart_height = [@project_tasks.count * 40 + 100, 400].max 
  #@project.reload
  #end
 #end
 #end
  
 #  def show
  #@project = Project.includes(:project_tasks).find_by!(project_no: params[:id])
  #@project.update_percent_completed! if @project.project_tasks.any?
#end

#def show
  #@project = if params[:project_no].present?
            #   Project.includes(:project_tasks).find_by!(project_no: params[:project_code])
           #  else
            #   Project.includes(:project_tasks).find(params[:id])
             #end
  #@project.update_percent_completed! if @project.project_tasks.any?
#end

def show1
  @project = Project.includes(:project_tasks)
                   .find_by!(project_no: params[:project_no])
  @project.update_percent_completed! if @project.project_tasks.any?
rescue ActiveRecord::RecordNotFound
  flash[:alert] = "Project not found"
  redirect_to projects_path
end

 def show2
    @project = Project.find_by(project_no: params[:project_no])
  @project_tasks = @project_tasks.to_a 
 end
 
 
 def show
 @sections = Section.all
  @project = Project.find_by(project_no: params[:project_no])
  
  if @project.nil?
    redirect_to projects_path, alert: 'Project not found'
    return
  end

  # Use project_tasks instead of tasks
  @project_tasks = @project.project_tasks.to_a
  
  # Optional: Order tasks if needed
  # @project_tasks = @project.project_tasks.order(:task_no).to_a
end




 

  # GET /projects/new
  def new
    @project = Project.new
    @departments = Department.all
    @sections = Section.all
     @sub_counties = SubCounty.all
   @wards = Ward.all
    @programmes = Programme.all
     
    
  end

  # GET /projects/1/edit
  def edit
  @departments = Department.all
  @sections = Section.all
   @sub_counties = SubCounty.all
     @wards = Ward.where(sub_county_code: @project.sub_county_code)
     # @programmes = Programme.all
   @programmes = Programme.where(department_code: @project.department_code)
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
     @departments = Department.all
     @sections = Section.all
     
@wards = Ward.all
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
  @sections = Section.all
   @sub_counties = SubCounty.all

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  
  
 
def get_wards
  @wards = Ward.where(sub_county_code: params[:sub_county_code]).order(:name)
  render json: @wards
end

def get_programmes
  @programmes = Programme.where(department_code: params[:department_code]).order(:name)
  render json: @programmes
end

def import
  if params[:file].blank?
    redirect_to projects_path, alert: "Please select a file to import."
    return
  end

  begin
    Project.import(params[:file])
    redirect_to projects_path, notice: "Projects imported successfully."
  rescue => e
    redirect_to projects_path, alert: "Error importing projects: #{e.message}"
  end
end





  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_project
    #  @project = Project.find(params[:id])
    #end
    
    
     def load_departments
    @departments = Department.all.order(:name)
  end
    
    
  #def set_project
   # @project = Project.find_by!(project_no: params[:project_no] || params[:id])
  #end
  
  def set_project
  if params[:project_no]
    @project = Project.find_by!(project_no: params[:project_no])
  else
    @project = Project.find(params[:id])
  end
end
  
    
    

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:project_no, :project_name, :financial_year, :brief_description, :department, :budgeted, :actual, :longitude, :latitude, :start_date, :end_date, :project_status, :sub_county, :sub_county_code, :ward, :village, :village_code, :department_code, :sub_county_name, :sub_section_name, :sub_section_code, :programme_name, :programme_code, :sub_programme_name, :sub_programme_code, :ward_code, :pictures) 
    end
end


