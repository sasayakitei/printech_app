# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :user
  has_one :shop_address, dependent: :destroy
  validates_associated :shop_address

  validates :name,
            length: { maximum: 32 },
            presence: true
  validates :description,
            length: { maximum: 1024 },
            presence: true
  validates :website_url,
            format: {
              with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
              message: 'URLではありません'
            },
            allow_blank: true
  validates :email,
            format: {
              with: /\A[^@\s]+@[^@\s]+\z/,
              message: 'メールアドレスではありません'
            },
            allow_blank: true
  validates :phone_number,
            format: {
              with: /\A\d{10,11}\z/,
              message: '電話番号ではありません'
            },
            allow_blank: true
end
