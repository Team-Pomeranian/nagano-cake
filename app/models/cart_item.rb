class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true


  def self.cart_items_total_price(cart_items)
    array = []
    cart_items.each do |cart_item|
      array << cart_item.item.price_no_tax * cart_item.quantity
    end
    return (array.sum * 1.1).floor
  end

  def subtotal
    item.with_tax_price.to_i * quantity
  end

end
