class AddLocationIdToNegotiation < ActiveRecord::Migration[5.0]
  def change
    add_column :negotiations, :location_id, :integer
  end
end
