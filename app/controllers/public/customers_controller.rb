class Public::CustomersController < ApplicationController
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
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number,:email)
  end
end
