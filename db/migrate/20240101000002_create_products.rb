class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :rarity, null: false
      t.string :image_url
      t.string :category
      t.string :wear
      t.boolean :available, default: true

      t.timestamps
    end
    
    add_index :products, :rarity
    add_index :products, :category
    add_index :products, :available
  end
end
