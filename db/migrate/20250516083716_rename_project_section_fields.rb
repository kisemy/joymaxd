class RenameProjectSectionFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :section_code, :programme_code
    rename_column :projects, :section_name, :programme_name
    rename_column :projects, :sub_section_code, :sub_programme_code
    rename_column :projects, :sub_section_name, :sub_programme_name
    
    # If you have indexes to rename:
    #rename_index :projects, 'index_projects_on_section_code', 'index_projects_on_programme_code'
    #rename_index :projects, 'index_projects_on_sub_section_code', 'index_projects_on_sub_programme_code'
  end

end

 
