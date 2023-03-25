class CreateShopInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_infos do |t|
      t.string :name, null: false
      t.string :shop_address, null: false
      t.text :shop_url, null: false

      t.timestamps
    end
  end
end
