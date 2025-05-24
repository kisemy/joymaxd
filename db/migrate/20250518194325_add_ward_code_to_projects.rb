class AddWardCodeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :ward_code, :string, limit: 10 
  end
end
