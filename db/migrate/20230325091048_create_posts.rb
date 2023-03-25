class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :shop_info_id
      t.integer :genre_id, null: false
      t.float :star, null: false
      t.text :comment, null: false
      t.boolean :post_status, null: false, default: true

      t.timestamps
    end
  end
end
