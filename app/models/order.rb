class Order < ApplicationRecord
  
  has_many :order_items
  belongs_to :customer
  
  enum status: {

     waiting_deposit: 0,
     confirm_deposit: 1,
     in_production: 2,
     preparing_shipment: 3,
     shipped: 4
  }
  
  enum payment_method: { credit_card: 0, transfer: 1 }

end
