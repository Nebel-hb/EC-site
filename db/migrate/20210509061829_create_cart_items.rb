class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
     t.integer :user_id
    t.integer :shop_id
    t.integer :amount
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
      # t.references :product, foreign_key: true
      # t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
