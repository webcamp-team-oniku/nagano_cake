class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  validates :amount, presence: true
  
  def subtotal
    item.add_tax_price*amount　#小計金額
  end
  
end


