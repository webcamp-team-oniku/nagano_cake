class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  validates :amount, presence: true

  def subtotal
<<<<<<< HEAD
    item.add_tax_price*amount　# 小計金額
=======
    item.add_tax_price*amount #小計金額
>>>>>>> origin/develop
  end

end


