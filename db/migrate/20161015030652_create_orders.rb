class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :items_ordered
      t.string :order_from
      t.string :rendezvous_point
      t.integer :user_id

      t.timestamps
    end
  end
end
