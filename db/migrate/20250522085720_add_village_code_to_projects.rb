class AddVillageCodeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :village_code, :string
  end
end
