class CustomersController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def new
    @customer = Customer.new
    uri   = URI.parse(request.fullpath)
    if uri.query
      params = CGI.parse(uri.query)
      content   = params['car'].first
      @customer.car_number = content
    end
    @fuels = Fuel.all
    @petro = @customer.petros.build
  end

  def create
    params[:customer][:petros_attributes]["0"][:day_fuel] = DateTime.strptime(params["day_fuel"], '%m/%d/%Y')
    fuel = Fuel.find(params["type_of_fuel"])
    params[:customer][:petros_attributes]["0"][:price_fuel] = fuel.price
    params[:customer][:petros_attributes]["0"][:type_fuel] = fuel.name
    params[:customer][:type_customer] = Integer(customer_params[:type_customer])
    @customer = Customer.new(customer_params)
    if @customer.save 
      flash[:success] = 'Khách hàng đã được tạo.'
      redirect_to @customer
    else
      flash[:alert] = @customer.errors.full_messages.join('  ;  ')
      redirect_to new_customer_path(car: params[:customer][:car_number])
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
      flash[:success] = 'Khách hàng đã được cập nhật!'
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    flash[:error] = 'Khách hàng đã được xóa.'
    redirect_to customers_path
  end

  def search_customer
    @customer = Customer.new
  end

  def search
    @customer = Customer.find_by(car_number: params[:customer][:car_number])
    if @customer
      flash[:alert] = 'Khách hàng đã tồn tại. Đến trang thông tin khách hàng.'
      redirect_to @customer
    else
      redirect_to new_customer_path(car: params[:customer][:car_number]), notice: 'Biến số xe không tồn tại, vui lòng tạo khách hàng mới.' 
    end

  end

  private
  def set_params
    @customer = Customer.find(params[:id])
  end

  def customer_params
  	params.require(:customer).permit(:name,:phone, :car_number, :company, :type_customer, petros_attributes: [:money, :amount, :type_fuel, :day_fuel, :price_fuel]) 
  end
end
