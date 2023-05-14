class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites ,source: :post
  has_many :likes, dependent: :destroy
  
  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.nickname = "ゲスト"
      file_path = Rails.new("app/assets/image/guest.png")
      customer.profile_image.attach(io: File.open(file_path), filename: 'guest.png', content_type: 'image/png')
    end
  end

  # 会員アイコン
  has_one_attached :profile_image
  
  def get_profile_image(width, hight)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-icon.png')
      profile_image.attach(io: File.open(file_path), filename: 'no-icon.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [width, hight]).processed
  end
  
  # バリデーション
  validates :email, presence: true
  validates :nickname, presence: true
  validates :password, presence: true
end
