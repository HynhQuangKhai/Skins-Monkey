class User < ApplicationRecord
  has_secure_password
  
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_products, through: :wishlists, source: :product
  
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  after_create :create_cart
  
  private
  
  def create_cart
    Cart.create(user: self)
  end
end
