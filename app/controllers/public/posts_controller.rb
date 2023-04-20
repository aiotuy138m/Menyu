class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @genres = Genre.all
    @post.customer_id = current_customer.id
    @shop_info = ShopInfo.new
    if params[:post][:select_shop] == "0"  # ラジオボタン0選択した時の処理
      @post.save!
    elsif params[:post][:select_shop] == "1"  # ラジオボタン1選択した時の処理
      @shop_info.shop_name = params[:post][:shop_name]
      @shop_info.address = params[:post][:address]
      @shop_info.shop_url = params[:post][:shop_url]
      if shop_info = ShopInfo.where(shop_name: "#{params[:post][:shop_name]}").count >=1 # 名前被り1件以上見つけている
        shop_info = ShopInfo.last
        @post.shop_info_id = shop_info.id
        @post.save!
      else # かぶってなかった時の処理
        @shop_info.save!
        shop_info = ShopInfo.last
        @post.shop_info_id = shop_info.id
        @post.save!
      end
    else
      return
    end
    redirect_to posts_path
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    else
      @posts = Post.where(post_status: true).order("created_at DESC")
    end
    if params[:shop_info_id]
      @shop_info = ShopInfo.find(params[:shop_info_id])
      @posts = @shop_info.post
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
    @posts = current_customer.post.where(post_status: false).order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:menu,:rate, :comment, :post_status, :shop_info_id, :image, genre_ids: [])
  end

end
