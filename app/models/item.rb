class Item < ApplicationRecord
  
  has_many :order_items
  belongs_to :genre
  has_many :order_items
  
  has_one_attached :image
  
end
