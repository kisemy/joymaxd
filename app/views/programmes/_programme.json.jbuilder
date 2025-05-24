json.extract! programme, :id, :programme_code, :programme_name, :department_code, :department_name, :current_co_pno, :current_co_telephone, :current_co_email, :general_programme_email, :complete_projects, :projects_in_progress, :created_at, :updated_at
json.url programme_url(programme, format: :json)
