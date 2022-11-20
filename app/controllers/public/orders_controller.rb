class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @deliveries = current_customer.deliveries.all
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:customer_id])
        @order.postcode = ship.postcode
        @order.address = ship.address
        @order.name = ship.name
    elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
        if params[:order][:postcode].blank? || params[:order][:address].blank? || params[:order][:name].blank?
          redirect_to new_order_path
        end
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @postage = 800
  end

  def thanks
  end

  def idex
  end

  def create
    @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      # ordered_itmemの保存
      current_customer.cart_items.each do |cart_item| # カートの商品を1つずつ取り出しループ
        @ordered_item = OrderedItem.new # 初期化宣言
        @ordered_item.item_id = cart_item.item_id # 商品idを注文商品idに代入
        @ordered_item.quantity = cart_item.quantity # 商品の個数を注文商品の個数に代入
        @ordered_item.tax_included_price = (cart_item.item.price*1.08).floor # 消費税込みに計算して代入
        @ordered_item.order_id =  @order.id # 注文商品に注文idを紐付け
        @ordered_item.save # 注文商品を保存
      end

      current_customer.cart_items.destroy_all # カートの中身を削除
      redirect_to orders_thanks_path
  end

  private

  def order_params
    params.require(:order).permit(:postage, :shipping_cost, :status, :payment_method, :postcode, :name, :deliveries, :customer_id)
  end
end
