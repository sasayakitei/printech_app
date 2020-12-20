class CreateShopAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_addresses do |t|
      t.references :shop, forein_key: true
      t.string :name, null: false
      t.string :zipcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.text :note

      t.timestamps
    end
  end
end
