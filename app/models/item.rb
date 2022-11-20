class Item < ApplicationRecord

  has_many :order_items
  belongs_to :genre
  has_many :order_items

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def add_tax_price
    (self.price * 1.10).round
  end
  
  def self.looks(search)
    Item.where("name LIKE?","%#{search}%")
  end

end
