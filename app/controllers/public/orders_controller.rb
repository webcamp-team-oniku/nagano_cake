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
  end

  def thanks
  end

  def idex
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:postage, :shipping_cost, :status, :payment_method, :postcode, :name, :deliveries, :customer_id)
  end
end
