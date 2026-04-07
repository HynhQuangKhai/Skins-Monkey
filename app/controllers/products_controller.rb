class ProductsController < ApplicationController
  def index
    @products = Product.available
    
    # Filtering
    @products = @products.by_rarity(params[:rarity]) if params[:rarity].present?
    @products = @products.by_category(params[:category]) if params[:category].present?
    
    if params[:min_price].present? && params[:max_price].present?
      @products = @products.price_range(params[:min_price].to_f, params[:max_price].to_f)
    end
    
    # Sorting
    @products = case params[:sort]
                when 'price_low'
                  @products.order(price: :asc)
                when 'price_high'
                  @products.order(price: :desc)
                when 'name'
                  @products.order(name: :asc)
                else
                  @products.order(created_at: :desc)
                end
    
    @products = @products.page(params[:page]).per(12) if defined?(Kaminari)
    @products = @products.limit(50) unless defined?(Kaminari)
  end
  
  def show
    @product = Product.find(params[:id])
    @in_wishlist = logged_in? && current_user.wishlists.exists?(product: @product)
    @related_products = Product.available.where(category: @product.category).where.not(id: @product.id).limit(4)
  end
end
