class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @genres = Genre.all
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    else
      @posts = Post.where(post_status: true).order("created_at DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.post_status == false && @post.customer != current_customer
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end

  def favorites # いいね機能・一覧
    @post = current_customer.favorite_posts.includes(:customer).order(created_at: :desc)
  end

  def not_active # 非公開一覧、Prefix：private_posts_path
    
    @posts = Post.where(post_status: false).order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:menu,:rate, :comment, :post_status, :image, :shop_info_id, genre_ids: [])
  end

end
