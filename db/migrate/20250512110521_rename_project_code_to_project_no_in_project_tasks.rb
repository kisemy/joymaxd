class RenameProjectCodeToProjectNoInProjectTasks < ActiveRecord::Migration[6.0]
  def change
      rename_column :project_tasks, :project_code, :project_no
  end
end
