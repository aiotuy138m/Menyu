class Genre < ApplicationRecord
  has_many :post_genres, dependent: :destroy, foreign_key: 'genre_id'
  has_many :posts, through: :post_genres
end
