class CreateAccountTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :account_types do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
