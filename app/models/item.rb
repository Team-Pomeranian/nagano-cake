class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

  def with_tax_price_order
    (price_no_tax * 1.1).floor
  end

  def cal_price
    (price_no_tax*1.1).floor.to_s(:delimited)
  end

  def adj_price
    price_no_tax.to_s(:delimited)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all  #検索結果が当てはまらない場合は全て表示
    end
  end

end