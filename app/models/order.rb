class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  before_save :total_price_order

  enum :status, ["Booked", "Canceled"]

  validates :quantity, :status, :product_id, :user_id, presence: true

  private
  def total_price_order
    self.total_price = quantity * product.price
  end
end
