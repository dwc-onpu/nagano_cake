class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!

  def top
     # <%= link_to "注文履歴一覧を見る",admin_root_path(sort: @customer)%> これを会員詳細ページに
    if params[:sort]
      @customer = Customer.find(params[:sort])
      @orders = @customer.orders.order(created_at: "DESC")
    else
      @orders = Order.all.order(created_at: "DESC")
    end

    @order_amount = 0
  end
end