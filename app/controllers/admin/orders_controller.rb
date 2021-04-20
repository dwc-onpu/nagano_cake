class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    redirect_back
  end


  private

  def orders_params
    params.require(:order).permit(:status)
  end


end
