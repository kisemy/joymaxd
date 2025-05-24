class CreateVillages < ActiveRecord::Migration[6.0]
  def change
    create_table :villages, id: false do |t|  # Disable default id
      t.string :village_code, primary_key: true
      t.text :village_name
      t.string :sub_county_code
      t.text :sub_county_name
      t.string :ward_code
      t.text :ward_name
      t.string :village_admin_pno
      t.text :village_admin_name
      t.string :village_admin_telephone
      t.text :village_admin_email
      t.timestamps
    end
  end
end
