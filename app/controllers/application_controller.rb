class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    add_flash_types :success,:info,:warning,:danger
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
        devise_parameter_sanitizer.permit(:acount_update,keys:[:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number])
    end
end
