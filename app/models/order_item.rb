class OrderItem < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum making_status: {
    
    cannot_make: 0, 
    is_waiting: 1, 
    is_making: 2, 
    completed: 3
  }

end
