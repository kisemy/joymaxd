class AddProgrammeNameToProgrammes < ActiveRecord::Migration[6.0]
  def change
    add_column :programmes, :programme_name, :string
  end
end
