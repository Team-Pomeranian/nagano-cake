class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.integer :genre_id, null: false
      t.integer :name, null: false
      t.text :introduction, null: false
      t.integer :price_no_tax, null: false
      t.string :item_image, null: false
      t.boolean :sales_status, null: false, default: true

      t.timestamps
    end
  end
end
