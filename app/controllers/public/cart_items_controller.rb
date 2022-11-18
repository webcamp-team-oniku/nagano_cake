class Public::CartItemsController < ApplicationController
  #before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_item.all
    @subtotal = @cart_items.inject(0){ |sum,item| sum + item.subtotal }# カートに入ってる商品の合計金額
  end

  def create
    if cart_item = current_customer.cart_items.find_by(item_id:cart_item_params[:item_id])
      cart_item.amount
      cart_item_params[:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end
