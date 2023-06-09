class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:status].present?
      @user.update_attribute(:status_id, params[:status][:status_id])
      notifier.ping("#{current_user.name}さんがステータスを登録しました、確認をお願いします。")
    end

    @user = User.find(params[:id])
    if current_user && @user.status_id.blank?
      redirect_to bosses_user_path(current_user), alert: 'ステータスが登録されていません。'
    end

    @user = User.find(params[:id])
    if @user.status_id.blank? || Status.find_by(id: @user.status_id).nil?
      redirect_to statuses_path, alert: 'ステータスを作成してください。'
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

  def toggle_admin_mode
    if current_user.admin?
      session[:admin_mode] = !session[:admin_mode]
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:status_id,:id)
  end

  def notifier
    Slack::Notifier.new(
      ENV['SLACK_WEBHOOK_URL'],
      channel: "##{ENV['SLACK_CHANNEL']}",
      username: '上司', 
      icon_emoji: ':sunglasses:'
    )
  end

end
