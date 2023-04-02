class Post < ApplicationRecord
  has_one_attached :image

  has_many :favorite, dependent: :destroy
  has_many :posts_coment, dependent: :destroy
  belongs_to :customer
  belongs_to :shop_info
  belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/no-image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
