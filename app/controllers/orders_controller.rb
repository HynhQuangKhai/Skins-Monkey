class OrdersController < ApplicationController
  before_action :require_login
  
  def index
    @orders = current_user.orders.recent
  end
  
  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end
  
  def new
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)
    
    if @cart_items.empty?
      flash[:alert] = "Your cart is empty"
      redirect_to products_path
    end
  end
  
  def create
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)
    
    if @cart_items.empty?
      flash[:alert] = "Your cart is empty"
      redirect_to products_path
      return
    end
    
    @order = current_user.orders.new(order_params)
    @order.total_amount = @cart.total_price
    @order.status = 'pending'
    
    if @order.save
      # Create order items from cart items
      @cart_items.each do |cart_item|
        @order.order_items.create(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price_at_time: cart_item.product.price
        )
      end
      
      # Clear the cart
      @cart.cart_items.destroy_all
      
      flash[:notice] = "Order placed successfully! Order ##{@order.id}"
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :shipping_address)
  end
end
