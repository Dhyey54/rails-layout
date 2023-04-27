class Employee < ApplicationRecord
  enum :gender, %w[Male Female]
  enum :hobby, {
    dancing: "dancing",
    singing: "singing",
    travelling: "travelling"
  }

  validates :employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, presence: true
  validates :mobile_number, length: { is: 10 }

  before_save :create_user

  private

  def create_user
    User.create(username: employee_name, email: email, password: password, role: "Merchant")
  end
end
