class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.guest
    # binding.pry
    sign_in user
    redirect_to statuses_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def after_sign_in_path_for(resource)
    statuses_path
  end

end