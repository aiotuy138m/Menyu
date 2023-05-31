class Public::HomesController < ApplicationController
  def top
    if customer_signed_in? # ログイン時
      @shop_infos = ShopInfo.all
      @genres = Genre.all
    end
  end
end
