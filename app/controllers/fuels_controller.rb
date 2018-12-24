class FuelsController < ApplicationController
  def new
    @fuel = Fuel.new
  end

  def index
    @fuels = Fuel.all
  end

  def create
    @fuel = Fuel.new(name: params[:name], price: params[:price])
    if @fuel.save
        flash[:success] = 'Tạo nhiên liệu thành công.'
        redirect_to root_path
    else
        flash[:success] = 'Tạo nhiên liệu thất bại.'
        redirect_to root_path
    end
	end
end
