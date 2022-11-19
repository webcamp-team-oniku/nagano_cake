class Admin::OrderItemsController < ApplicationController
  
  def update
    @order = Order.find(params[:order_id])
    @order_item = OrderItems.find(params[:id])
    @order_items = @order.order_item.all
    
    is_updated = true
    if @order_item.update(order_item_params)
      @order_item.update(status: 2) if @order_item.status == "in_production"# 製作ステータスを製作中にすると、注文ステータスを製作中に自動更新
      @order_items.each do |order_item|
        if order_item.status != "completed" # 製作ステータスが全て製作完了ではない場合 
          is_updated = false # 上記で定義してあるis_updatedをfalseに変更
        end
      end
      @order.update(status: 3) if is_updated #製作ステータスが全て製作完了になれば注文ステータスが発送準備中に自動更新
    end
    redirect_to request.referer
  end


private
  def order_item_params
      params.require(:order_item).permit(:status)
  end
  

