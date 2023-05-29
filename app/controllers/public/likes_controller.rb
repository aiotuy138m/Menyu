class Public::LikesController < ApplicationController
  before_action :authenticare_customer # 未ログインアクセス制限

  def create
    posts = Post.find(params[:post_id])
    like = current_customer.likes.new(post_id: posts.id)
    like.save
    redirect_to post_path(posts), success: "いいねしました"
  end

  def destroy
    posts = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: posts.id)
    like.destroy
    redirect_to post_path(posts), info: "いいね解除しました"
  end
end
