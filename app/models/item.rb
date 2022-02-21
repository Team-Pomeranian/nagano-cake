class Item < ApplicationRecord
  has_many :orders, through: :order_items
end
