class Post < ApplicationRecord
  has_one_attached :image

  has_many :favorite, dependent: :destroy
  has_many :posts_coment, dependent: :destroy
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres
  belongs_to :customer
  belongs_to :shop_info

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/no-image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  def save_genres
    PostGenre.create!(post_id: self.id, genre_id: find_genre.id)
  end
  
end
