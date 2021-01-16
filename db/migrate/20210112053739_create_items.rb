class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :productname, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :productstate_id, null: false
      t.integer :deliveryfee_id, null: false
      t.integer :region_id, null: false
      t.integer :deliverydate_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
