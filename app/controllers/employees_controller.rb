class EmployeesController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save 
      flash[:success] = 'Nhân viên đã được tạo.'
      redirect_to employees_path 
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
      flash[:success] = 'Nhân viên đã được cập nhật.'
      redirect_to @employees
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    flash[:error] = 'Nhân viên đã được xóa.'
    redirect_to employees_path
  end

  private
  def set_params
    @employee = Employee.find(params[:id])
  end

  def employee_params
  	params.require(:employee).permit(:name,:phone, :address, :gender, :department, :position, :slary) 
  end
end
