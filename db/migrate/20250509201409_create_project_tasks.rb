class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks, id: false do |t|
      t.string :task_no, primary_key: true
      t.string :auto_no
      t.string :p_tsk_01
      t.text :task_description
      t.string :project_code
      t.date :planned_start_date
      t.date :planned_end_date
      t.date :actual_start_date
      t.date :actual_end_date
      t.integer :planned_task_duration
      t.integer :actual_task_duration
      t.decimal :percentage_coverage_planned
      t.decimal :percentage_coverage
      t.boolean :parallel

      t.timestamps
    end
  end
end

