class Public::PostGenresController < ApplicationController
  def post_genre_params
    params.require(:post_genre).permit(:genre_id, :post_id)
  end
end
