class CangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :shop_info_id, :integer, null: true
  end
  
  def down
    cange_column :posts, :shop_info_id, :integer, null: false
  end
end
