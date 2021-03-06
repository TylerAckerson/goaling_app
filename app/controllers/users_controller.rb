class UsersController < ApplicationController

  before_action :require_no_user, except: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @goals = @user.goals
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
