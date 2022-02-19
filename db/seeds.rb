# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
  email: 'user1@exam.com',
  password: 'aaaaaaaa',
  first_name: '中村',
  last_name: '真',
  first_name_kana: 'ナカムラ',
  last_name_kana: 'シン',
  post_code: '7313164',
  address: '広島県',
  telephone_number: '0828484192',
  is_deleted: 'false',
)
