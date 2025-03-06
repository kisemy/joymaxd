class AddDescriptionToBanks < ActiveRecord::Migration[6.0]
  def change
    add_column :banks, :description, :string
  end
end
