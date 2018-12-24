class AdminsController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save 
      flash[:success] = 'Admin đã được tạo.'
      redirect_to admins_path
    else
      render :new 
    end
  end

  def index
    @admins = Admin.all
  end

  # def show
  #   @petro = Petro.new
  #   @petros = Petro.where(customer_id: params[:id]).order(day_fuel: 'desc')
  #   @fuels = Fuel.all
  # end
  
  def edit
  end

  def update
    if @admin.update(admin_params)
      flash[:success] = 'Admin đã được cập nhật.'
      redirect_to edit_admin_path(@admin) 
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    flash[:danger] = 'Nhân viên đã được xóa..'
    redirect_to employees_path
  end

  private
  def set_params
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :user_name, :email, :phone, :role, :password, :avatar) 
  end
end
