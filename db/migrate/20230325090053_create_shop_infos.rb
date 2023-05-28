class CreateShopInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_infos do |t|
      t.string :shop_name, null: false
      t.string :address, null: false
      t.text :shop_url
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
