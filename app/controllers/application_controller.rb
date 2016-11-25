class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  private

  def require_login
    return redirect_to root_path unless signed_in?
  end
end
