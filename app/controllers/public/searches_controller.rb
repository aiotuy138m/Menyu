class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "店名"
      @shop_infos = ShopInfo.looks(params[:search],params[:word])
      @posts = Post.where(shop_info_id: [@shop_infos.ids]).where(post_status: true).where(post_deleted: false).order("created_at DESC")
    else
      @genres = Genre.looks(params[:search], params[:word])
      @posts = Post.left_joins(:post_genres).where(:post_genres => {:genre_id => [@genres.ids]}).where(post_status: true).where(post_deleted: false).order("created_at DESC")
    end
  end

end
