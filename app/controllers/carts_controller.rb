class CartsController < ApplicationController
  before_action :require_login
  
  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)
  end
  
  def add
    @cart = current_user.cart
    @product = Product.find(params[:product_id])
    
    cart_item = @cart.cart_items.find_or_initialize_by(product: @product)
    cart_item.quantity += 1 if cart_item.persisted?
    cart_item.quantity = 1 unless cart_item.persisted?
    
    if cart_item.save
      flash[:notice] = "#{@product.name} added to cart"
    else
      flash[:alert] = "Could not add item to cart"
    end
    
    redirect_back(fallback_location: products_path)
  end
  
  def update
    @cart = current_user.cart
    @cart_item = @cart.cart_items.find(params[:id])
    
    if params[:quantity].to_i > 0
      @cart_item.update(quantity: params[:quantity])
      flash[:notice] = "Cart updated"
    else
      @cart_item.destroy
      flash[:notice] = "Item removed from cart"
    end
    
    redirect_to cart_path
  end
  
  def remove
    @cart = current_user.cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    
    flash[:notice] = "Item removed from cart"
    redirect_to cart_path
  end
end
