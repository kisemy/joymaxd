module ProjectsHelper
def gantt_chart_data(tasks)
    tasks.map do |task|
      {
        id: task.task_no,
        name: task.task_description,
        start: task.planned_start_date,
        end: task.planned_end_date,
        progress: task.percentage_coverage.to_f,
        dependencies: task.p_tsk_01
      }
    end.to_json.html_safe
  end


end
