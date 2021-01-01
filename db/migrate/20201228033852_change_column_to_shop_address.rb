class ChangeColumnToShopAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :shop_addresses, :prefecture, :prefecture_id
  end
end
