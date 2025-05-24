class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
     create_table :departments, id: false do |t|
      t.string :department_code, primary_key: true
      t.text :department_name
      t.string :current_CEC_p_no
      t.text :current_CEC_name
      t.string :current_CEC_telephone
      t.text :current_CEC_email
      t.text :general_dept_email

      t.timestamps
    end
  end
end


