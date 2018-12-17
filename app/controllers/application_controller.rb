class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :require_login

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  def set_auto_password
    return SecureRandom.urlsafe_base64.to_s 
  end
end
