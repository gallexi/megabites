class AddLocationIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :location_id, :integer
  end
end
