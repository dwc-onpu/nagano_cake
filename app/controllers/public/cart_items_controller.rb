class Public::CartItemsController < ApplicationController

  def index
    @cart_products = CartItem.where(customer_id: current_customer.id)
    @item1 = CartItem.find(1)
    @item2 = CartItem.find(2)
  end

end


# @cart_item = CartItem.new(id: 1, item_id: 1, customer_id: 1, amount: 2)
# @cart_item = CartItem.new(id: 2, item_id: 2, customer_id: 1, amount: 3)