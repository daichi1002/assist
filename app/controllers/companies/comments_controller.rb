class Companies::CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user, :company)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(company_id: current_company.id, article_id: params[:article_id])
  end
end
