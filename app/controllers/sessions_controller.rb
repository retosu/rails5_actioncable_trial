class SessionsController < ApplicationController

  def create
    provider = Provider.entry(omniauth_params)
    signed_in(provider.user)
    redirect_to root_path
  end

  private
  def omniauth_params
    request.env["omniauth.auth"]
  end

  def signed_in(user)
    reset_session
    session[:user_id] = user.id
  end
end
