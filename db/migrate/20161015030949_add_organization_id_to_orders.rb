class AddOrganizationIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :organization_id, :integer
  end
end
