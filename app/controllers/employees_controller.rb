class EmployeesController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save 
      redirect_to employees_path, notice: 'Nhân viên đã được tạo.' 
    else
      render :new 
    end
  end

  def index
    @employees = Employee.all
  end

  # def show
  #   @petro = Petro.new
  #   @petros = Petro.where(customer_id: params[:id]).order(day_fuel: 'desc')
  #   @fuels = Fuel.all
  # end
  
  def edit
  end

  def update
    if @@employee.update(employee_params)
      redirect_to @employees, notice: 'Admin was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: 'Nhân viên đã được xóa.' 
  end

  private
  def set_params
    @employee = Employee.find(params[:id])
  end

  def employee_params
  	params.require(:employee).permit(:name,:phone, :address, :gender, :department, :position, :slary) 
  end
end
