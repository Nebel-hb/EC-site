class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer "user_id"
      t.string "name"
      t.integer "postcode"
      t.integer "prefecture_code"
      t.string "address_city"
      t.string "address_street"
      t.string "address_building"
      t.integer "shopping_cost", default: 800
      t.integer "total_payment"
      t.integer "payment_method", default: 0
      t.integer "nummber", default: 0
      t.timestamps
    end
  end
end
