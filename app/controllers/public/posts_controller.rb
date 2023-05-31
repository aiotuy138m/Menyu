class Public::PostsController < ApplicationController
  before_action :authenticare_customer # 未ログインアクセス制限
  before_action :ensure_correct_customer, {only: [:edit, :update]} # ログインユーザーのみが編集可能

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
      if @post.save
        redirect_to posts_path, success: "投稿しました"
      else
        render :new
      end
    elsif params[:post][:select_shop] == "1"  # ラジオボタン1選択した時の処理
      @shop_info.shop_name = params[:post][:shop_name]
      @shop_info.address = params[:post][:address]
      @shop_info.shop_url = params[:post][:shop_url]
      if shop_info = ShopInfo.where(shop_name: "#{params[:post][:shop_name]}").count >=1 # 名前被り1件以上見つけている
        shop_info = ShopInfo.where(shop_name: "#{params[:post][:shop_name]}")
        shop_info = shop_info.find_by_id(shop_info.ids) # whereで探したやつを１件に絞っている
        @post.shop_info_id = shop_info.id
        if @post.save
          redirect_to posts_path, success: "投稿しました"
        else
          render :new
        end
      else # かぶってなかった時の処理
        @shop_info.save
        @post.shop_info_id = @shop_info.id
        if @post.save
          redirect_to posts_path, success: "投稿しました"
        else
          render :new
        end
      end
    else # 店情報を選択しなかったときの処理
      if @post.save
        redirect_to posts_path, success: "投稿しました"
      else
        render :new
      end
    end
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = Post.posted_genre(@genre).actives.page(params[:page]).order("created_at DESC")
    elsif params[:shop_info_id]
      @shop_info = ShopInfo.find(params[:shop_info_id])
      @posts = @shop_info.post.actives.page(params[:page]).order("created_at DESC")
    else
      @posts = Post.actives.page(params[:page]).order("created_at DESC")
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

  # お気に入り機能・一覧
  def favorites
    @post = current_customer.favorite_posts.includes(:customer).page(params[:page]).order(created_at: :desc)
  end

  # 非公開一覧、Prefix：private_posts_path
  def not_active
    @posts = current_customer.post.where(post_status: false).page(params[:page]).order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:menu,:rate, :comment, :post_status, :shop_info_id, :image, genre_ids: [])
  end

end
