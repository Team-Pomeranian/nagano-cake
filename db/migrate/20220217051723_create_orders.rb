class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postcode, null: false
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.integer :payment, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
