class Shop < ApplicationRecord
  belongs_to :user
  has_one :shop_address, dependent: :destroy

  validates :name, length: { maximum: 32 }, null: false
  validates :description, length: { maximum: 1024 }
  validates :website_url, 
            format: {
              with: /\A#{URI::regexp(%w(http https))}\z/,
              message: 'URLではありません'
            },
            allow_blank: true,
            allow_nil: true
  validates :email,
            format: {
              with: /\A[^@\s]+@[^@\s]+\z/,
              message: 'メールアドレスではありません'
            },
            allow_blank: true,
            allow_nil: true
  validates :phone_number,
            format: {
              with: /\A\d{10,11}\z/,
              message: '電話番号ではありません'
            },
            allow_blank: true,
            allow_nil: true
end
