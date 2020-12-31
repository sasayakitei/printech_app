class ChangeColumnToShopAddresses < ActiveRecord::Migration[6.0]
  def up
    change_column_null :shop_addresses, :name, true
  end

  def down
    change_column_null :shop_addresses, :name, false
  end
end
