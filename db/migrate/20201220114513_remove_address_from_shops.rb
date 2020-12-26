class RemoveAddressFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :address_id
  end
end
