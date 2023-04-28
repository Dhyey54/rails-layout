class Employee < ApplicationRecord
  enum :gender, %w[Male Female]
  HOBBY = %i[Dancing Singing Travelling]

  # validates :employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, presence: true
  # validates :mobile_number, length: { is: 10 }

  before_save :create_user

  private

  def create_user
    User.create(username: employee_name, email: email, password: password, role: "")
  end
end
