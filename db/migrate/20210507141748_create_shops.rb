class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.text :item
      t.text :body
      t.string :image_id
      t.text :genre
      t.string :price
      t.text :status

      t.timestamps
    end
  end
end
