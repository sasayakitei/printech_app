class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :website_url
      t.string :email
      t.string :phone_number
      t.references :address, forein_key: true
      t.timestamps
    end
  end
end
