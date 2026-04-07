# SkinsMonkey - CS2 Skins Marketplace

A Ruby on Rails web application for buying and selling Counter-Strike 2 skins.

## Features

- **User Authentication**: Register, login, and logout functionality with secure password hashing
- **Product Catalog**: Browse CS2 skins with filtering by rarity, category, wear, and price
- **Product Details**: View detailed information about each skin with rarity indicators
- **Shopping Cart**: Add items to cart, update quantities, and remove items
- **Checkout System**: Complete orders with payment method selection and Steam Trade URL
- **Wishlist**: Save favorite skins for later purchase
- **Order History**: View past orders and their details

## Tech Stack

- **Framework**: Ruby on Rails 7.1
- **Database**: SQLite3
- **Authentication**: BCrypt for secure password hashing
- **Frontend**: Vanilla CSS with custom dark theme design
- **Templating**: ERB (Embedded Ruby)

## Project Structure

```
skins_marketplace/
├── app/
│   ├── controllers/       # MVC Controllers
│   ├── models/           # MVC Models (User, Product, Cart, Order, etc.)
│   ├── views/            # ERB Templates
│   └── assets/           # CSS, JS, images
├── config/               # Routes, database config
├── db/                   # Migrations and seeds
└── README.md
```

## Models

- **User**: Handles authentication, has one cart, many orders and wishlists
- **Product**: CS2 skin data with name, price, rarity, image, category, wear
- **Cart**: Belongs to user, contains cart items
- **CartItem**: Links products to carts with quantity
- **Order**: Records completed purchases with total amount and status
- **OrderItem**: Individual items within an order
- **Wishlist**: User's saved products for later

## Installation & Setup

### Prerequisites

- Ruby 3.2.0 or higher
- Bundler gem
- SQLite3

### Setup Steps

1. **Install dependencies**:
   ```bash
   bundle install
   ```

2. **Setup database**:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

3. **Start the server**:
   ```bash
   rails server
   ```

4. **Open in browser**:
   Navigate to `http://localhost:3000`

## Default Accounts

After running seeds, you can create your own account through the registration page.

## Features Walkthrough

### Authentication
- Users can register with username, email, and password
- Secure login with bcrypt password hashing
- Session-based authentication

### Product Browsing
- Grid view of all available skins
- Filter by rarity (Consumer to Covert, Knives, Gloves)
- Filter by category (Rifle, Pistol, SMG, Heavy, Knife, etc.)
- Sort by price (low/high) or name
- Search by price range

### Product Details
- Full skin information with large image
- Rarity color coding
- Related products suggestions
- Quick add to cart/wishlist buttons

### Cart Management
- View all items in cart
- Update quantities
- Remove individual items
- Order summary with total calculation

### Checkout
- Select payment method (Credit Card, PayPal, Crypto)
- Enter Steam Trade URL for delivery
- Review order before confirming

### Wishlist
- Save items for later
- Move items from wishlist to cart
- Remove items from wishlist

### Order History
- View all past orders
- Check order status (Pending, Completed, Cancelled)
- See detailed order information
- View Steam Trade URL used for delivery

## Rarity Colors

The application uses CS2's standard rarity colors:
- Consumer Grade: #b0c3d9
- Industrial Grade: #5e98d9
- Mil-Spec: #4b69ff
- Restricted: #8847ff
- Classified: #d32ce6
- Covert: #eb4b4b
- Knives/Gloves: #ffd700 (Gold)

## Routes

| Path | Description |
|------|-------------|
| `/` | Home page - Product listing |
| `/products` | Browse all skins |
| `/products/:id` | Product detail page |
| `/cart` | Shopping cart |
| `/checkout` | Checkout page |
| `/orders` | Order history |
| `/orders/:id` | Order details |
| `/wishlist` | Wishlist page |
| `/login` | Login page |
| `/signup` | Registration page |
| `/profile` | User profile |

## Development

### Running Tests
```bash
rails test
```

### Database Reset
```bash
rails db:drop db:create db:migrate db:seed
```

## License

This project is for educational purposes.

## Credits

Created as a Ruby on Rails learning project for building marketplace applications.
