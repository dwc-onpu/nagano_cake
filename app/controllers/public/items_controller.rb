class Public::ItemsController < ApplicationController
  def index
    @products = Item.page(params[:page]).per(8).order(id: "DESC")
  end

  def show
    @product = Item.find(params[:id])
    @cart_product = CartItem.new
  end
end


