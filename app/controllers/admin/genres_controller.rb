class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, success: "保存しました"
    else
      @genre = Genre.all
      render :index, danger: "保存失敗しました"
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, success: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.delete
    redirect_to admin_genres_path, danger: "削除しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
