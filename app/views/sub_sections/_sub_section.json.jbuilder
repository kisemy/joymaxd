json.extract! sub_section, :id, :sub_section_code, :sub_section_name, :section_id, :department_id, :complete_projects, :projects_in_progress, :created_at, :updated_at
json.url sub_section_url(sub_section, format: :json)
