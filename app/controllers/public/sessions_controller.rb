# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer,only:[:create]

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
    root_path
  end

  protected
  
  def reject_customer
    @customer = Customer.find_by(email:params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password])&&(@customer.is_deleted == true)
        flash[:danger] = "退会済みです、新しく登録してください"
      else
        flash[:danger] = "パスワードが間違っているようです"
      end
    else
      flash[:danger] = "このメールアドレスでは登録されていません"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
