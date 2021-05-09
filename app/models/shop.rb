class Shop < ApplicationRecord
  has_many :shop_categories
  has_many :categories, through: :shop_categories
  attachment :image
end
