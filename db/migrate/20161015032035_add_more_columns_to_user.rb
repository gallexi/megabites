class AddMoreColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :location_id, :integer
    add_column :users, :phone_number, :string
  end
end
