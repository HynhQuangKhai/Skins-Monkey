class WishlistsController < ApplicationController
  before_action :require_login
  
  def show
    @wishlist_items = current_user.wishlists.includes(:product)
  end
  
  def add
    @product = Product.find(params[:product_id])
    @wishlist = current_user.wishlists.new(product: @product)
    
    if @wishlist.save
      flash[:notice] = "#{@product.name} added to wishlist"
    else
      flash[:alert] = @wishlist.errors.full_messages.join(", ")
    end
    
    redirect_back(fallback_location: products_path)
  end
  
  def remove
    @wishlist = current_user.wishlists.find(params[:id])
    @wishlist.destroy
    
    flash[:notice] = "Item removed from wishlist"
    redirect_to wishlist_path
  end
end
