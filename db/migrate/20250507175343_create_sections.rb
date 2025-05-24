class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections, id: false do |t|
      t.string :section_code, primary_key: true
      t.text :section_name
      t.text :current_co_name
      t.string :current_co_telephone
      t.text :current_co_email
      t.text :general_section_email
      t.string :department_code
      t.text :department_name
      t.decimal :complete_projects
      t.decimal :projects_in_progress

      t.timestamps
    end
  end
end
