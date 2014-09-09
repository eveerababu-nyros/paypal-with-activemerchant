class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :product_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact_no
      t.string :address1
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :card_type
      t.date :card_expires_on
      t.string :ip_address
      t.datetime :purchased_at
      t.float :total_cost

      t.timestamps
    end
  end
end
