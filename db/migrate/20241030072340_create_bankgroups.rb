class CreateBankgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :bankgroups do |t|
      t.text :code
      t.text :description
      t.text :gl_account

      t.timestamps
    end
  end
end
