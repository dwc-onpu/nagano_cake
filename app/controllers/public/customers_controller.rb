class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
    @customer = Customer.find_by(id:current_customer.id)
  end
  
  def update
    current_customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def unsubscribe
  end
  
  def withdraw
    customer = Customer.find_by(id:current_customer.id)
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number,:email)
  end
  
  def is_deleted_params
    params.permit(:is_deleted)
  end
end
