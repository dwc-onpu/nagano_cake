class ChangeColumnDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :shipping_cost, from: nil, to: 800
    change_column_default :orders, :payment_method, from: nil, to: 0
    change_column_default :orders, :status, from: nil, to: 0
  end
end