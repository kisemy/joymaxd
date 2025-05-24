class CreateFinancialYears < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_years do |t|
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
