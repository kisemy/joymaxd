json.extract! project, :id, :project_no, :project_name, :financial_year, :brief_description, :department, :budgeted, :actual, :longitude, :latitude, :start_date, :end_date, :project_status, :sub_county, :ward, :village, :created_at, :updated_at
json.url project_url(project, format: :json)
