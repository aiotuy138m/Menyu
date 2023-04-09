class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :shop_info_id, null: true
      t.string :menu, null: false
      t.float :rate, null: false, default: 0
      t.text :comment, null: false
      t.boolean :post_status, null: false, default: true

      t.timestamps
    end
  end
end
