class CustomersController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def new
    @customer = Customer.new
    @fuels = Fuel.all
    @petro = @customer.petros.build
  end

  def create
    params[:customer][:petros_attributes]["0"][:day_fuel] = DateTime.strptime(params["day_fuel"], '%m/%d/%Y')
    fuel = Fuel.find(params["type_of_fuel"])
    params[:customer][:petros_attributes]["0"][:price_fuel] = fuel.price
    params[:customer][:petros_attributes]["0"][:type_fuel] = fuel.name
    @customer = Customer.new(customer_params)
    if @customer.save 
      redirect_to @customer, notice: 'Khách hàng đã được tạo.' 
    else
      render :new 
    end
  end

  def index
    @customers = Customer.all
  end

  def show
    @petro = Petro.new
    @petros = Petro.where(customer_id: params[:id]).order(day_fuel: 'desc')
    @fuels = Fuel.all
  end
  
  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Admin was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: 'Khách hàng đã được xóa.' 
  end

  private
  def set_params
    @customer = Customer.find(params[:id])
  end

  def customer_params
  	params.require(:customer).permit(:name,:phone, :car_number, :company, :type_customer, petros_attributes: [:money, :amount, :type_fuel, :day_fuel, :price_fuel]) 
  end
end
