class FollowersController < ApplicationController
  before_action :authenticate_user!
  def create
    boss = current_user.followers.build(subordinate_id: params[:user_id])
    boss.save
    redirect_to request.referer || root_path
  end

  def destroy
    boss = current_user.followers.find_by(subordinate_id: params[:user_id])
    boss.destroy
    redirect_to request.referer || root_path
  end
end
