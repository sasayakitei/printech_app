class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
    add_column :users, :avatar_url, :string
  end
end
