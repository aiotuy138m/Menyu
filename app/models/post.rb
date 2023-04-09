class Post < ApplicationRecord
  has_one_attached :image

  has_many :favorite, dependent: :destroy
  has_many :posts_coment, dependent: :destroy
  has_many :post_genres, dependent: :destroy
  has_many :genres, -> { order(:name) }, through: :post_genres
  belongs_to :customer
  belongs_to :shop_info

  def get_image(width, hight)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, hight]).processed
  end

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0
  }, presence: true

  

end
