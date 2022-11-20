class Public::ItemsController < ApplicationController
    def index
      # ページネーション
      @items = Item.page(params[:page])
      @genres = Genre.all
    end

    def show
    end

end