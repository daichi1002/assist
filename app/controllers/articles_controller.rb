class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order('created_at DESC').limit(4)
  end
end
