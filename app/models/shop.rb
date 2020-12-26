class Shop < ApplicationRecord
  belongs_to :user
  has_one :shop_address, dependent: :destroy
end
