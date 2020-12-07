class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to new_article_comment_path
    else
      render :new
    end
  end

  private
  def comment_params
    params.permit(:text).merge(user_id:current_user.id, article_id: params[:article_id])
  end
end
