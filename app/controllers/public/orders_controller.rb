class Public::OrdersController < ApplicationController

  def new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = current_customer.orders.new
  end

  def confirm
    @order = current_customer.orders.new
    @cart_items = CartItem.where(customer_id: current_customer.id)

    case params[:address]
    when "customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    when "customer.addresses"
      @address = Address.find(select_address_params[:select_address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    when "add_address"
      @add_address = Address.new(address_params)
      @add_address.customer_id = current_customer.id
      if  @add_address.save
        @order.postal_code = @add_address.postal_code
        @order.address = @add_address.address
        @order.name = @add_address.name
      else
        flash[:notice] = "入力エラーが発生したため、入力ページにリダイレクトされました。"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items.all
    if @order.save
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item_id
        @order_details.price = (cart_item.item.price.to_i * 1.1).floor
        @order_details.amount = cart_item.amount
        @order_details.save!
      end
      # current_customer.cart_items.destroy_all
      redirect_to controller: :orders, action: :complete
    else
      render :new
    end
  end

  def index
    @orders = current_customer.orders.order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private
  def select_address_params
    params.require(:order).permit(:select_address)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def order_params
    params.require(:order).permit(:customer_id, :status, :total_payment, :postal_code, :address, :name, :payment_method, :shipping_cost)
  end

end
