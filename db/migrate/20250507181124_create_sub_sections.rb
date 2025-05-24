class CreateSubSections < ActiveRecord::Migration[6.0]
   def change
    create_table :sub_sections, id: false do |t|
      t.string :sub_section_code, primary_key: true
      t.text :sub_section_name
      t.string :section_code
      t.text :section_name
      t.string :department_code
      t.text :department_name
      t.decimal :complete_projects
      t.decimal :projects_in_progress

      t.timestamps
    end
  end
end
