class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    status = params[:order_item][:making_status]
    @order = order_item.order

    order_item.update(order_item_params)
    # 製作ステータスを製作中にすると、注文ステータスを製作中に自動更新
    @order.update(status: "in_production") if order_item.making_status == "is_making"
    #製作ステータスが全て製作完了になれば注文ステータスが発送準備中に自動更新
    @order.update(status: "preparing_shipment")  if @order.order_items.count  == @order.order_items.where(making_status: "completed").count
    redirect_to admin_order_path(@order)
  end


private
  def order_item_params
      params.require(:order_item).permit(:making_status)
  end
end

