class PetrosController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @petros = Petro.all
  end

  def create
    params[:petro][:day_fuel] = DateTime.strptime(params["day_fuel"], '%m/%d/%Y')
    fuel = Fuel.find(params["type_of_fuel"])
    params[:petro][:price_fuel] = fuel.price
    params[:petro][:type_fuel] = fuel.name
    @petro = Petro.new(petro_params)
    if @petro.save 
      redirect_to customer_path(petro_params[:customer_id]), notice: 'Giao dịch đã được tạo.' 
    else
      render :new 
    end
  end

  def edit
    @fuels = Fuel.all
    @customer = Customer.find(@petro.customer_id)
  end

  def destroy
    cus_id = @petro.customer_id
    @petro.destroy
    redirect_to customer_path(cus_id), notice: 'Giao dịch đã được xóa.' 
  end

  def update
    params[:petro][:day_fuel] = DateTime.strptime(params["day_fuel"], '%m/%d/%Y')
    fuel = Fuel.find(params["type_of_fuel"])
    params[:petro][:price_fuel] = fuel.price
    params[:petro][:type_fuel] = fuel.name
    if @petro.update(petro_params)
      redirect_to customer_path(@petro.customer_id), notice: 'Nội dung giao dịch đã được sửa' 
    else
      render :edit
    end
  end

  private
  def set_params
    @petro = Petro.find(params[:id])
  end

  def petro_params
  	params.require(:petro).permit(:money, :amount, :type_fuel, :day_fuel, :price_fuel, :customer_id) 
  end
end
