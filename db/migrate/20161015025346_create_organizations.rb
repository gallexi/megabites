class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone_number
      t.string :official_email
      t.string :address
      t.string :email_base
      t.text :exceptions_list

      t.timestamps
    end
  end
end
