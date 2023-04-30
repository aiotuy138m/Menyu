class Public::FavoritesController < ApplicationController
  def create
    posts = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: posts.id)
    favorite.save
    redirect_to post_path(posts), success: "次食べるリストにいれました"
  end

  def destroy
    posts = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: posts.id)
    favorite.destroy
    redirect_to post_path(posts), info: "次食べるリストから抜きました"
  end
end
