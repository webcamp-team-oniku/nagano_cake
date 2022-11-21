class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to request.referer
    else
      render 'index'
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to delivery_path(@delivery)
    else
      render "edit"
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
  	redirect_to request.referer
  end

  private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :post_code, :address, :name)
  end

end
