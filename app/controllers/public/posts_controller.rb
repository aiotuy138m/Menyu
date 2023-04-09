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
      redirect_to my_page_customers_path
    else
      render :new
    end
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    else
      @posts = Post.all
    end
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
    params.require(:post).permit(:menu,:rate, :comment, :post_status, :image, :shop_info_id, genre_ids: [])
  end

end
