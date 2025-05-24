class ProjectTask < ApplicationRecord
  
  self.primary_key = 'task_no'
  
  belongs_to :project, foreign_key: 'project_no', optional: true
  #belongs_to :project, foreign_key: 'project_no', primary_key: 'project_no'
  
  
  # Add any validations or custom methods here
  
  before_create :generate_task_no
  
  
  # app/models/project_task.rb
def formatted_start_date
  planned_start_date&.strftime('%Y-%m-%d')
end

def formatted_end_date
  planned_end_date&.strftime('%Y-%m-%d')
end


#belongs_to :project
  
  belongs_to :project,
             foreign_key: 'project_no',  # Matches column in this table
             primary_key: 'project_no'   # Matches project's primary key
             
  after_save :update_project_completion, if: :saved_change_to_completed?
  
  private
  
  def update_project_completion
    project.update_percent_completed!
  end




  def generate_task_no
    last_task = ProjectTask.order(:task_no).last
    last_number = last_task ? last_task.task_no.split('/').last.to_i : 0
    self.task_no = "tsk/#{(last_number + 1).to_s.rjust(2, '0')}"
  end
  
  
  

end
