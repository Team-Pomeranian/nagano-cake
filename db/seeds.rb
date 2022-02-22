# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OrderItem.create!(
  order_id: '1',
  item_id: '1',
  quantity: '2',
  price: '1200',
  production_status: '0',
)

Item.create!(
  genre_id: '1',
  name: 'ケーキ',
  introduction: '長野県産のりんごを使用しています',
  price_no_tax: '600',
  item_image: 'りんごのケーキ',
  sales_status: '0'
)

Genre.create!(
  name: 'ケーキ'
)