class CalltimesController < ApplicationController
  def new
    @calltime = Calltime.new
    @calltimes = Calltime.where(petro_id: params[:id])
    @petro_id = params[:id]
  end

  def create
    @call_time = Calltime.new(calltime_params)
    if @call_time.save
        redirect_to calls_path, notice: "Cuộc gọi đã được lưu!"
    else
        redirect_to calls_path, notice: "Cuộc gọi lưu thất bại!"
    end
  end

  private
  def set_params
    @call_time = Calltime.find(params[:id])
  end

  def calltime_params
  	params.require(:calltime).permit(:result, :notice, :petro_id) 
  end
end
