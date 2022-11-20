class SearchesController < ApplicationController
  
  def search
    @items = Item.looks(params[:search])
  end
  
end
