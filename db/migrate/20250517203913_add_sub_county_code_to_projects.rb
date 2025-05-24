class AddSubCountyCodeToProjects < ActiveRecord::Migration[6.0]
  def change
   add_column :projects, :sub_county_code, :string
  end
end
