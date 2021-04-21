class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update!(orders_params)
    flash[:notice] = '注文ステータスを更新しました'
    redirect_to admin_order_path(@order)
  end


  private

  def orders_params
    params.require(:order).permit(:status)
  end


end
