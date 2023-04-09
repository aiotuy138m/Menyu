class CreatePostGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :post_genres do |t|
      t.references :post, null: false #参照だからカラム名じゃなくてモデル名？
      t.references :genre, null: false
      t.timestamps
    end
    add_index :post_genres, [:post_id, :genre_id], unique: true
  end
end
