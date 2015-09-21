class SessionsController < ApplicationController

  before_action :require_current_user, only: [:destroy]
  before_action :require_no_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      login(user)
      redirect_to goals_url
    else
      flash.now[:errors] = ["Invalid login credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
