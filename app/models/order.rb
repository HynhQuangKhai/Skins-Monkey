class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  
  STATUSES = %w[pending completed cancelled].freeze
  
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: STATUSES }
  
  scope :recent, -> { order(created_at: :desc) }
  
  def display_total
    "$#{'%.2f' % total_amount}"
  end
  
  def status_class
    case status
    when 'completed' then 'status-completed'
    when 'cancelled' then 'status-cancelled'
    else 'status-pending'
    end
  end
  
  def formatted_date
    created_at.strftime("%B %d, %Y at %I:%M %p")
  end
end
