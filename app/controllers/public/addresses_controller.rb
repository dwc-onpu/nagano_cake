class Public::AddressesController < ApplicationController

def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
    redirect_to addresses_path
    else
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    render :index
    end

end

  def index
    @address = Address.new
    @addresses = current_customer.addresses

  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path

  end

  def destroy
   address = Address.find(params[:id])
   address.destroy
   redirect_to addresses_path

  end

  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :name, :address)
  end
end
