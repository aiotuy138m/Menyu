class Public::SearchesController < ApplicationController
  before_action :authenticare_customer # 未ログインアクセス制限

  def search
    @range = params[:range]
    if @range == "店名"
      @shop_infos = ShopInfo.looks(params[:search],params[:word])
      @posts = Post.where(shop_info_id: [@shop_infos.ids]).actives.page(params[:page]).order("created_at DESC")
    else
      @genres = Genre.looks(params[:search], params[:word])
      @posts = Post.posted_genre(@genre).actives.page(params[:page]).order("created_at DESC")
    end
  end

end
