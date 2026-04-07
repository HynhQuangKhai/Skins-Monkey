class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  
  RARITIES = %w[consumer industrial milspec restricted classified covert knives gloves].freeze
  WEARS = %w[factory_new minimal_wear field_tested well_worn battle_scarred].freeze
  CATEGORIES = %w[rifle pistol smg heavy knife gloves agent sticker case].freeze
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rarity, presence: true, inclusion: { in: RARITIES }
  validates :wear, inclusion: { in: WEARS }, allow_nil: true
  validates :category, inclusion: { in: CATEGORIES }, allow_nil: true
  
  scope :available, -> { where(available: true) }
  scope :by_rarity, ->(rarity) { where(rarity: rarity) if rarity.present? }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :price_range, ->(min, max) { where(price: min..max) if min.present? && max.present? }
  
  def display_price
    "$#{'%.2f' % price}"
  end
  
  def rarity_color
    case rarity
    when 'consumer' then '#b0c3d9'
    when 'industrial' then '#5e98d9'
    when 'milspec' then '#4b69ff'
    when 'restricted' then '#8847ff'
    when 'classified' then '#d32ce6'
    when 'covert' then '#eb4b4b'
    when 'knives', 'gloves' then '#ffd700'
    else '#b0c3d9'
    end
  end
end
