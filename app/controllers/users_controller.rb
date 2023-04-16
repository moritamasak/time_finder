class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:status].present?
      @user.update_attribute(:status_id, params[:status][:status_id])

    end
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def update
  end

  def bosses
    user = User.find(params[:id])
    @users = user.bosses
  end

  def subordinates
    user = User.find(params[:id])
    @users = user.subordinates
  end

  private

  def user_params
    params.require(:user).permit(:name,:status_id,:id)
  end

end
