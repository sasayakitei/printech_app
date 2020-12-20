class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :shops

  validates :nickname, length: { in: 3..16 }
  validates :avatar_url,
    format: {
      with: /\A#{URI::regexp(%w(http https))}\z/,
      message: 'URLではありません。'
    },
    allow_blank: true,
    allow_nil: true
end
