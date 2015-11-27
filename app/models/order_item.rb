class OrderItem < ActiveRecord::Base
  belongs_to :order
  
  def discount
    original_price - sold_price
  end
end
