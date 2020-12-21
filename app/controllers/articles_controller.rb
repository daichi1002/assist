class ArticlesController < ApplicationController
  before_action :search_article, only: [:index, :search]
  def index
    @articles = Article.includes(:user).order('created_at DESC').limit(4)
    @ranks = Article.find(Like.group(:article_id).order('count(article_id) DESC').limit(4).pluck(:article_id))
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    @results = @a.result(distinct: true).page(params[:page]).per(8).order('created_at DESC')
  end

  private

  def search_article
    @a = Article.ransack(params[:q])
  end
end
