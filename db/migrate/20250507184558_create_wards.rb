class CreateWards < ActiveRecord::Migration[6.0]
  create_table :wards, id: false do |t|  # Disable default id
      t.string :ward_code, primary_key: true
      t.text :ward_name
      t.string :ward_admin_pno
      t.text :ward_admin_name
      t.string :ward_admin_telephone
      t.text :ward_admin_email
      t.string :sub_county_code
      t.text :sub_county_name
      t.timestamps
end
end
