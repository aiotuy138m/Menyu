class Post < ApplicationRecord
  has_one_attached :image
  
  #scope :actives, -> { where(post_status: true).where(post_deleted: false) }
  #scope :search_by_genre, -> (genre){ left_joins(:post_genres).where(:post_genres => {:genre_id => [genre]}) }
  #Post.actives.search_by_genre(@genre).page(params[:page]).order("created_at DESC")

  has_many :post_comments, dependent: :destroy
  has_many :post_genres, dependent: :destroy
  has_many :genres, -> { order(:name) }, through: :post_genres, source: :genre
  belongs_to :customer
  belongs_to :shop_info, optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites ,source: :post
  has_many :likes, dependent: :destroy
  has_many :reported_post, class_name: "Report", foreign_key: "reported_id", dependent: :destroy

  def get_image(width, hight)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      image.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, hight]).processed
  end

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0
  }, presence: true
  
  validates :menu, presence: true
  validates :comment, presence: true
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
