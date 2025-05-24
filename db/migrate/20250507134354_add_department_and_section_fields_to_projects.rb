class AddDepartmentAndSectionFieldsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :department_code, :string
    add_column :projects, :section_code, :string
    add_column :projects, :section_name, :text
    add_column :projects, :sub_section_code, :string
    add_column :projects, :sub_section_name, :text
  end
end
  
