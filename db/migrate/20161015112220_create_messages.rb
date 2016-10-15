class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :negotiation_id
      t.references :user, foreign_key: true
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
