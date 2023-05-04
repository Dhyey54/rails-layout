class Employee < ApplicationRecord
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses

  enum :gender, %w[Male Female]
  HOBBY = %i[Dancing Singing Travelling]

  validates :employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, :document, presence: true
  validates :mobile_number, length: { is: 10 }
  validates :employee_name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  before_create :create_user
  before_destroy :destroy_user

  private

  def create_user
    User.new({username: employee_name, email: email, password: password, password_confirmation: password, role: "Employee"}).save unless User.exists?(username: employee_name)
  end

  def destroy_user
    User.find_by(username: employee_name).destroy
  end
end
