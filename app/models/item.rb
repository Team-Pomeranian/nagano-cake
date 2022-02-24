class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items

  def with_tax_price
    (price_no_tax * 1.1).floor
  end

end
