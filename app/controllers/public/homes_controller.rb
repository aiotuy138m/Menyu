class Public::HomesController < ApplicationController
  def top
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
      @shop_infos = ShopInfo.all
      @genres = Genre.all
    end
  end
end
