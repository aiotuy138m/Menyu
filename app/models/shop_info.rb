class ShopInfo < ApplicationRecord
  has_many :post, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
end
