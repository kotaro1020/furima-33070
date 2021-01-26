class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postalcode, null: false
      t.integer :region_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :buildingname, null: false
      t.string :phonenumber, null: false
      t.references :product_record, foreign_key: true
      t.timestamps
    end
  end
end
