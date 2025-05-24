class AddPostedToStockinHeader < ActiveRecord::Migration[6.0]
  def change
     add_column :stockin_headers, :posted, :boolean, default: false
  end
end
