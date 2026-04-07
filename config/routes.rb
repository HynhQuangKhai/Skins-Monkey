Rails.application.routes.draw do
  root "products#index"
  
  # Authentication
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :users, only: [:show]
  resources :products, only: [:index, :show]
  
  # Cart
  get "cart", to: "carts#show"
  post "cart/add/:product_id", to: "carts#add", as: :add_to_cart
  patch "cart/update/:id", to: "carts#update", as: :update_cart_item
  delete "cart/remove/:id", to: "carts#remove", as: :remove_from_cart
  
  # Wishlist
  get "wishlist", to: "wishlists#show"
  post "wishlist/add/:product_id", to: "wishlists#add", as: :add_to_wishlist
  delete "wishlist/remove/:id", to: "wishlists#remove", as: :remove_from_wishlist
  
  # Orders
  resources :orders, only: [:index, :show, :create]
  get "checkout", to: "orders#new"
  post "checkout", to: "orders#create"
end
