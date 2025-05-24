class Project < ApplicationRecord
self.primary_key = 'project_no'

  belongs_to :department, foreign_key: :department_code, primary_key: :code
  belongs_to :sub_county, foreign_key: :sub_county_code, primary_key: :code
  belongs_to :ward, foreign_key: :ward_code, primary_key: :code
  belongs_to :financial_year, foreign_key: :financial_year, primary_key: :year
  




 # has_many :project_tasks, foreign_key: 'project_code', primary_key: 'code'
 has_many :project_tasks, foreign_key: 'project_no', primary_key: 'project_no'
 def to_param
    project_no
  end
  
 #belongs_to :financial_year, optional: true 
has_many_attached :pictures 

 
has_many :project_tasks, 
           foreign_key: 'project_no',  # Matches column in project_tasks table
           primary_key: 'project_no'   # Matches this model's primary key
           
  def update_percent_completed!
    update_column(:percent_completed, calculate_live_percentage)
  end

  def calculate_live_percentage
    project_tasks.where(completed: true).sum(:percentage_coverage).to_f
  end
  
   #belongs_to :department, 
       #      foreign_key: 'department_code',
           #  primary_key: 'department_code',
            # optional: true # This allows the department to be nil
  
  #validates :department, presence: true
  
 #belongs_to :ward, foreign_key: :sub_county_code, primary_key: :sub_county_code, optional: true
  #belongs_to :ward, foreign_key: 'ward_code', primary_key: 'ward_code' # match these to your columns
 # belongs_to :ward, foreign_key: 'ward_code', primary_key: 'ward_code'
  #belongs_to :sub_county, foreign_key: 'sub_county_code', primary_key: 'ward_code'



  
  before_create :generate_project_no
  
    #validates :department_code, length: { maximum: 255 }
  #validates :section_code, length: { maximum: 255 }
  #validates :sub_section_code, length: { maximum: 255 }
  # Add any other model logic you need
  
  
    scope :active, -> { where(status: 'active') }
  
  
  
   geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present? && obj.full_address_changed? }

  def full_address
    [village, ward, sub_county].compact.join(', ')
  end

  def full_address_changed?
    village_changed? || ward_changed? || sub_county_changed?
  end
  
  

 def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    
    project = find_by(project_no: row["project_no"]) || new
    project.attributes = {
      project_no: row["project_no"],
      project_name: row["project_name"],
      financial_year: row["financial_year"],
      brief_description: row["brief_description"],
      department: row["department"],
      department_code: row["department_code"],
      programme_name: row["programme_name"],
      programme_code: row["programme_code"],
      sub_programme_name: row["sub_programme_name"],
      sub_programme_code: row["sub_programme_code"],
      budgeted: row["budgeted"],
      actual: row["actual"],
      longitude: row["longitude"],
      latitude: row["latitude"],
      project_status: row["project_status"],
      sub_county_code: row["sub_county_code"],
      sub_county: row["sub_county"],
      ward: row["ward"],
      village: row["village"]
    }
    project.save!
  end
end 

  
  
  
  
  
  

  private
  
  def set_financial_year_from_association
  self.financial_year = financial_year_association.code if financial_year_association.present?
end
  
  

  def generate_project_no
    last_project = Project.order(:project_no).last
    if last_project
      last_number = last_project.project_no.split('/').last.to_i
      self.project_no = "SCG/PRJ/#{(last_number + 1).to_s.rjust(2, '0')}"
    else
      self.project_no = "scg/prj/01"
    end
  end

end
