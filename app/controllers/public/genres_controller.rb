class Public::GenresController < ApplicationController
  
  def show
    @genres = Genre.all
    @items = Genre.find(params[:id]).items
  end
end
