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
        redirect_to root_path, notice: "Create brands completed!"
    else
        redirect_to root_path, notice: "Failed!"
    end
	end
end
