class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  # skip_load_and_authorize_resource

  def new
    if logged_in?
      redirect_to admins_path
    end
  end

  def create
   user = Admin.find_by email: params[:session][:user_name].downcase
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      flash[:success] = "Đăng nhập thành công"
      log_in user
      redirect_to root_path
    else
      # Create an error message.
       # Not quite right!
      flash[:error] = 'Sai Email hoặc Password. Vui Lòng kiểm tra lại!'
      render 'new'
    end
  end

  
 	def destroy
    log_out
    flash[:alert] = "Bạn đã đăng xuất"
    redirect_to login_path
  end

end
