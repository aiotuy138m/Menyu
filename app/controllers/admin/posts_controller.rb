class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @posts = Post.where(customer_id: @customer.id).page(params[:page]).per(10).order("created_at DESC")
    else
      @posts = Post.page(params[:page]).per(10).order("created_at DESC")
    end
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
