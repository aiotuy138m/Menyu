class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.post_comment.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to post_path(@post), success: "投稿しました"
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id]), danger: "削除"
  end

private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
