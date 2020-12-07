class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to article_path
    else
      render :new
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, article_id: params[:article_id])
  end
end
