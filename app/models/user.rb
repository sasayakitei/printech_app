# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_one  :shop_address, through: :shop

  validates :nickname,
            length: { in: 3..16 },
            presence: true
  validates :first_name,
            length: { maximum: 16 },
            allow_blank: true
  validates :family_name,
            length: { maximum: 16 },
            allow_blank: true
  validates :avatar_url,
            format: {
              with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
              message: 'URLではありません。'
            },
            allow_blank: true
end
