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
    @order_items = OrderItem.where(order_id: params[:id])
    if @order.update(order_params)
      @order_items.update_all(status: 1) if @order.status == "is_waiting"
    end
      #入金確認したら自動更新で製作ステータスが全て製作待ちになる
    redirect_to request.referer
  end


  private
    def order_params
      params.require(:order).permit(:status)
    end

end

