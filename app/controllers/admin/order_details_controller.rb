class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    flash[:notice] = '製作ステータスを更新しました'
    if @order_detail.making_status == "製作中"
      @order = @order_detail.order
      @order.update(status:"製作中")
      redirect_to admin_order_path(@order)
    elsif @order_detail.making_status == "製作完了"
          @order = @order_detail.order
        if @order.order_details.all?{|m| m.making_status =="製作完了"}
           @order.update(status:"発送準備中")
           redirect_to admin_order_path(@order)
        elsif
           redirect_to admin_order_path(@order)
        end
    elsif
       @order = @order_detail.order
       redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order)
    end
  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end