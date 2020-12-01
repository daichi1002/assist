class Admin::ArticlesController < ApplicationController
  before_action :if_not_admin
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:image, :title, :genre_id, :type_id, :area_id, :maximum_price, :start_date, :end_date, :information, :url, :created_at, :updated_at).merge(user_id: current_user.id)
  end
end
