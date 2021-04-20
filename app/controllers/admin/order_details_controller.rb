class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_details.update(order_details_params)
    redirect_back
  end


  private

  def order_details_params
    params.require(:order_details).permit(:making_status)
  end

end
