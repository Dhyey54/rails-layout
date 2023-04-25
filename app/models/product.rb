class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  validates :title, :description, :price, presence: true
end
