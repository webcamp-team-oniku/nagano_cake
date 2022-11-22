class Order < ApplicationRecord

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_price, presence: true
  validates :payment_method, presence: true
  validates :shipping_cost, presence: true
  validates :status, presence: true


  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_items


  enum status: {

     waiting_deposit: 0,
     confirm_deposit: 1,
     in_production: 2,
     preparing_shipment: 3,
     shipped: 4
  }

  enum payment_method: { credit_card: 0, transfer: 1 }

end
