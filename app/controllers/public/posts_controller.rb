class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save!
      # genre_list = genre_params[:name].split(/[[:blank:]]+/).select(&:present?)
      @post.save_genres(genre_list)
      redirect_to @post
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @genre_list = @post.genres.map { |genre| genre.name }
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

  private

  def post_params
    params.require(:post).permit(:rate, :comment, :post_status, :image, :shop_info_id, genre_id: [])
  end

  def genre_params
    params.require(:post).permit(:genre_names)
  end
end
