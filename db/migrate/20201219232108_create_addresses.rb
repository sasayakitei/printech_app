class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :zipcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.timestamps
    end
  end
end
