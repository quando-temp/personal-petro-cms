class FuelsController < ApplicationController
  def new
    @fuel = Fuel.new
  end

  def index
    @fuels = Fuel.all
  end

  def create
    @fuel = Fuel.new(fuel_params)
    if @fuel.save
        flash[:success] = 'Tạo nhiên liệu thành công.'
        redirect_to fuels_path
    else
        flash[:alert] = @fuel.errors.full_messages.join('  ;  ')
        render :new
    end
  end

  def edit
    @fuel = Fuel.find(params[:id])
  end
  
  def update
    @fuel = Fuel.find(params[:id])
    if @fuel.update(fuel_params)
      flash[:success] = 'Nội dung giao dịch đã được sửa'
      redirect_to fuels_path
    else
      render :edit
    end
  end

  def destroy
    @fuel = Fuel.find(params[:id])
    @fuel.destroy
    flash[:error] = 'Nhiên liệu đã được xóa.'
    redirect_to fuels_path
  end

  private
  def fuel_params
  	params.require(:fuel).permit(:name, :price) 
  end
end
