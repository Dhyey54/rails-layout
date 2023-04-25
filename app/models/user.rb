class User < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, %w[Admin Merchant]

  validates :role, presence: true
  validates_uniqueness_of :username, on: :create, message: "has already been taken"
end
