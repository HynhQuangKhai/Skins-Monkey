class UsersController < ApplicationController
  before_action :require_guest, only: [:new, :create]
  before_action :require_login, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to SkinsMonkey, #{@user.username}!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @user = current_user
    @orders = @user.orders.recent.limit(5)
    @wishlist = @user.wishlists.includes(:product)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
