class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_admin_mode

  def toggle_admin_mode
    if current_user&.admin?
      session[:admin_mode] = !session[:admin_mode]
    end
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  # 管理者モードの状態を設定するメソッドを追加
  def set_admin_mode
    @admin_mode = session[:admin_mode] || false
  end

end
