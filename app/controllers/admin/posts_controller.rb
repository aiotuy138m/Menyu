class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @report = Report.where("reported_id = params[:id]")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_posts_path, success: "更新しました"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, danger: "削除しました"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:post_deleted)
  end
  
end
