class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @items_new = @items.order(created_at: :DESC).limit(4) #created_atで制作日時、DESCで降順
    @genres = Genre.all
  end
  
  def about
  end
  
  

end
