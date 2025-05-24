class AddCompletedToProjectTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :project_tasks, :completed, :boolean, default: false
  end
end
