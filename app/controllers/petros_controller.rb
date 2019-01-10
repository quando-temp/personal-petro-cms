class PetrosController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @petros = Petro.all
  end

  def create
    params[:petro][:day_fuel] = DateTime.strptime(params["day_fuel"], '%d/%m/%Y')
    fuel = Fuel.find(JSON.parse(params["type_of_fuel"])[0])
    params[:petro][:price_fuel] = fuel.price
    params[:petro][:type_fuel] = fuel.name
    params[:petro][:amount] = Float(params[:petro][:money])/Float(params[:petro][:price_fuel])
    @petro = Petro.new(petro_params)
    if @petro.save 
      flash[:success] = 'Giao dịch đã được tạo.'
      redirect_to customer_path(petro_params[:customer_id])
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
    flash[:success] = 'Giao dịch đã được xóa.'
    redirect_to customer_path(cus_id) 
  end

  def update
    params[:petro][:day_fuel] = DateTime.strptime(params["day_fuel"], '%d/%m/%Y')
    fuel = Fuel.find(params["type_of_fuel"])
    params[:petro][:price_fuel] = fuel.price
    params[:petro][:type_fuel] = fuel.name
    if @petro.update(petro_params)
      flash[:success] = 'Nội dung giao dịch đã được sửa'
      redirect_to customer_path(@petro.customer_id)
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
