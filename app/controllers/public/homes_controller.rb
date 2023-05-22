class Public::HomesController < ApplicationController
  def top
    if customer_signed_in?
      @shop_infos = ShopInfo.all
      @genres = Genre.all
    end
  end
end
