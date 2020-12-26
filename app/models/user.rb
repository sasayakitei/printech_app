class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :shops, dependent: :destroy

  validates :nickname, length: { in: 3..16 }
  validates :first_name,  length: { maximum: 16 }, allow_blank: true, allow_nil: true
  validates :family_name, length: { maximum: 16 }, allow_blank: true, allow_nil: true
  validates :avatar_url,
    format: {
      with: /\A#{URI::regexp(%w(http https))}\z/,
      message: 'URLではありません。'
    },
    allow_blank: true,
    allow_nil: true
end
