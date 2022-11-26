class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page]).order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    #入金確認したら自動更新で製作ステータスが全て製作待ちになる
    if params[:order][:status] == "confirm_deposit"
      @order.order_items.update_all(making_status: "is_waiting")
    end
    redirect_to admin_order_path(@order)
  end


  private
    def order_params
      params.require(:order).permit(:status)
    end

end

