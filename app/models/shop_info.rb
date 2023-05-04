class ShopInfo < ApplicationRecord
  has_many :post, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  
  def self.looks(search, word)
    if search == "perfect_match"
      @shop_info = ShopInfo.where("shop_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @shop_info = ShopInfo.where("shop_name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @shop_info = ShopInfo.where("shop_name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @shop_info = ShopInfo.where("shop_name LIKE?", "%#{word}%")
    else
      @shop_info = ShopInfo.all
    end
  end
end
