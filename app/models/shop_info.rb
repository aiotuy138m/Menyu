class ShopInfo < ApplicationRecord
  has_many :post, dependent: :destroy
end
