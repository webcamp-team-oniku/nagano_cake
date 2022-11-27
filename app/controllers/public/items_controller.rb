class Public::ItemsController < ApplicationController

    def index
      # ページネーション
      @items = Item.page(params[:page]).per(8)
      @genres = Genre.all
      #全商品件数を表示するために設定
      @items_all = Item.all
    end

    def show
      @item = Item.find(params[:id])
      @genres = Genre.all
      @cart_item = CartItem.new
    end

end