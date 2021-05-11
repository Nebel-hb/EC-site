class CartItem < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :amount, presence: true
  validates :shop_id, presence: true
  validates :user_id, presence: true

end
