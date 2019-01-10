class StationsController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  # def new
  #   @station = Customer.new
  #   @fuels = Fuel.all
  #   @petro = @station.petros.build
  # end

  # def create
  #   params[:customer][:petros_attributes]["0"][:day_fuel] = DateTime.strptime(params["day_fuel"], '%d/%m/%Y')
  #   fuel = Fuel.find(params["type_of_fuel"])
  #   params[:customer][:petros_attributes]["0"][:price_fuel] = fuel.price
  #   params[:customer][:petros_attributes]["0"][:type_fuel] = fuel.name
  #   @station = Customer.new(customer_params)
  #   if @station.save 
  #     redirect_to @station, notice: 'Khách hàng đã được tạo.' 
  #   else
  #     render :new 
  #   end
  # end

  # def index
  #   @stations = Customer.all
  # end

  # def show
  #   @petro = Petro.new
  #   @petros = Petro.where(customer_id: params[:id]).order(day_fuel: 'desc')
  #   @fuels = Fuel.all
  # end
  
  # def edit
  # end

  def update
    if @station.update(station_params)
      flash[:success] = 'Cập nhật thông tin thành công.'
      redirect_to edit_station_path(@station)
    else
      render :edit
    end
  end

  # def destroy
  #   @station.destroy
  #   redirect_to customers_path, notice: 'Khách hàng đã được xóa.' 
  # end

  private
  def set_params
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name,:logo, :address, :hotline) 
  end
end
