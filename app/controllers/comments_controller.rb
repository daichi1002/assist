class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save && current_user.admin?
      redirect_to admin_article_path(@comment.article)
    elsif @comment.save 
      redirect_to article_path(@comment.article)
    else
      render :new
    end
  end
  
  private
  def comment_params
    params.permit(:text).merge(user_id:current_user.id, article_id: params[:article_id])
  end
end
