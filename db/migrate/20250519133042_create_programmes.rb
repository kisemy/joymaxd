class CreateProgrammes < ActiveRecord::Migration[6.0]
   def change
    create_table :programmes, id: false, primary_key: :programme_code do |t|
      t.string :programme_code, null: false
      t.text :section_name
      t.string :department_code
      t.text :department_name
      t.string :current_co_pno
      t.string :current_co_telephone
      t.text :current_co_email
      t.text :general_programme_email
      t.decimal :complete_projects
      t.decimal :projects_in_progress

      t.timestamps
    end
    
    add_index :programmes, :programme_code, unique: true
  end
end
