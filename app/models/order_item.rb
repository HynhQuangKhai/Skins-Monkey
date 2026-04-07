class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price_at_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def total_price
    price_at_time * quantity
  end
  
  def display_price
    "$#{'%.2f' % price_at_time}"
  end
  
  def display_total
    "$#{'%.2f' % total_price}"
  end
end
