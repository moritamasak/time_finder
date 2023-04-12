class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def bosses
    user = User.find(params[:id])
    @users = user.bosses
  end

  def subordinates
    user = User.find(params[:id])
    @users = user.subordinates
  end

end
