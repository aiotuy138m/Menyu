class AddPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_deleted, :boolean, default: false, null: false
  end
end
