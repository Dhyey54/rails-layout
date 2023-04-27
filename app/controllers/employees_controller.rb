class EmployeesController < ApplicationController
  before_action :employee_details, only: %i[show edit update destroy]

  def index
    @employees = Employee.order(:id)
  end
 
  def show; end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  def edit
  end
  
  def update
    # binding.pry
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy

    redirect_to root_path, status: :see_other
  end

  def search
    @employees = Employee.where('employee_name LIKE ?', "%#{params[:query]}%")
    puts @employees
    if @employees.nil?
      redirect_to employees_path
    else
      render search_employees_path
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:id, :employee_name, :email, :password, :gender, { hobbies: [] }, :address, :mobile_number, :birth_date, :document, :query)
  end

  def employee_details
    @employee = Employee.find(params[:id])
  end
end
