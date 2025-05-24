class CreateSubCounties < ActiveRecord::Migration[6.0]
  def change
   
     create_table :sub_counties, id: false do |t|  # Disable default id
      t.string :sub_county_code, primary_key: true  # Set as primary key 
      t.text :sub_county_name

      t.timestamps
    end
  end
end
