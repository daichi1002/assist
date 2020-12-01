class ArticlesController < ApplicationController
  before_action :search_article, only: [:index, :search]
  def index
    @articles = Article.includes(:user).order('created_at DESC').limit(4)
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
  end

  private

  def search_article
    @a = Article.ransack(params[:q])
    @results = @a.result
  end
end
