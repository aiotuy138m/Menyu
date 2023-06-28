class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @report = Report.where(created_at: range)
    @post = Post.where(created_at: range)
    @customer = Customer.where(created_at: range)
    @genre = Genre.all
    @shop_info = ShopInfo.all
  end
end
