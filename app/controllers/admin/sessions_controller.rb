# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_admin,only:[:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
    def after_sign_out_path_for(resource)
         new_admin_session_path
    end

  protected
  
  def reject_admin
    @admin = Admin.find_by(email:params[:admin][:email])
    if @admin
      unless @admin.valid_password?(params[:admin][:password])
        flash[:danger] = "パスワードが間違っています"
      end
    else
      flash[:danger] = "メールアドレスが間違っています"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
