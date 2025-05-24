json.extract! project_task, :id, :task_no, :auto_no, :p_tsk_01, :task_description, :project_code, :planned_start_date, :planned_end_date, :actual_start_date, :actual_end_date, :planned_task_duration, :actual_task_duration, :percentage_coverage_planned, :percentage_coverage, :parallel, :created_at, :updated_at
json.url project_task_url(project_task, format: :json)
