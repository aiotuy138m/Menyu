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
      @post.save
      redirect_to posts_path, success: "投稿しました"
    elsif params[:post][:select_shop] == "1"  # ラジオボタン1選択した時の処理
      @shop_info.shop_name = params[:post][:shop_name]
      @shop_info.address = params[:post][:address]
      @shop_info.shop_url = params[:post][:shop_url]
      if shop_info = ShopInfo.where(shop_name: "#{params[:post][:shop_name]}").count >=1 # 名前被り1件以上見つけている
        shop_info = ShopInfo.where(shop_name: "#{params[:post][:shop_name]}")
        shop_info = shop_info.find_by_id(shop_info.ids) # whereで探したやつを１件に絞っている
        @post.shop_info_id = shop_info.id
        @post.save
        redirect_to posts_path, success: "投稿しました"
      else # かぶってなかった時の処理
        @shop_info.save
        shop_info = ShopInfo.last
        @post.shop_info_id = shop_info.id
        @post.save
        redirect_to posts_path, success: "投稿しました"
      end
    else
      redirect_to new_post_path, danger: "投稿に失敗しました"
    end
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = Post.left_joins(:post_genres).where(:post_genres => {:genre_id => [@genre]}).where(post_status: true).where(post_deleted: false).page(params[:page]).order("created_at DESC")
    elsif params[:shop_info_id]
      @shop_info = ShopInfo.find(params[:shop_info_id])
      @posts = @shop_info.post.where(post_status: true).where(post_deleted: false).page(params[:page]).order("created_at DESC")
    else
      @posts = Post.where(post_status: true).where(post_deleted: false).page(params[:page]).order("created_at DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    if @post.post_status == false && @post.customer != current_customer
      redirect_to posts_path, danger: "この投稿は非公開設定されており閲覧できません" # もし直接投稿をみようとしてきた時の対策
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, success: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path, danger: "投稿を削除しました"
  end

  def favorites # お気に入り機能・一覧
    @post = current_customer.favorite_posts.includes(:customer).page(params[:page]).order(created_at: :desc)
  end

  def not_active # 非公開一覧、Prefix：private_posts_path
    @posts = current_customer.post.where(post_status: false).page(params[:page]).order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:menu,:rate, :comment, :post_status, :shop_info_id, :image, genre_ids: [])
  end

end
