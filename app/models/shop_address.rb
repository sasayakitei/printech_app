# frozen_string_literal: true

class ShopAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :shop
  belongs_to_active_hash :prefecture

  validates :name,
            length: { maximum: 16 },
            allow_blank: true
  validates :zipcode,
            format: {
              with: /\A\d{7}\z/,
              message: '郵便番号は数字7桁で入力してください'
            },
            presence: true
  validates :prefecture_id,
            presence: true
  validates :city,
            length: { maximum: 16 },
            presence: true
  validates :block,
            length: { maximum: 64 },
            presence: true
  validates :building,
            length: { maximum: 64 },
            allow_blank: true
  validates :note,
            length: { maximum: 256 },
            allow_blank: true
end
