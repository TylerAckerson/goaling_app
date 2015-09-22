class GoalsController < ApplicationController
  before_action :require_current_user

  def index
    # @goals = Goal.all.where(prvt: false)
    @users = User.all.includes(:goals)
  end

  def show
  end

  def complete
    @goal = Goal.find(params[:id])
    @goal.completed = true
    @goal.save!
    redirect_to goals_url
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end



  def destroy

  end

  private
  def goal_params
    params.require(:goal).permit(:title, :user_id, :prvt)
  end
end
