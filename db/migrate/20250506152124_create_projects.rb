class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    
      create_table :projects, id: false do |t|
      t.string :project_no, primary_key: true
      t.text :project_name
      t.string :financial_year
      t.text :brief_description
      t.string :department
      t.decimal :budgeted
      t.decimal :actual
      t.decimal :longitude
      t.decimal :latitude
      t.date :start_date
      t.date :end_date
      t.string :project_status
      t.string :sub_county
      t.string :ward
      t.string :village

      t.timestamps
    end
  end
end
