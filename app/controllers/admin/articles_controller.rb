class Admin::ArticlesController < ApplicationController
  before_action :if_not_admin
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
