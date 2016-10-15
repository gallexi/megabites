class CreateNegotiations < ActiveRecord::Migration[5.0]
  def change
    create_table :negotiations do |t|
      t.string :order_from
      t.bool :order_from_agreed
      t.text :food_items
      t.bool :food_items_agreed
      t.string :rendezvous_point
      t.bool :rendezvous_agreed
      t.integer :user_id
      t.text :customers

      t.timestamps
    end
  end
end
