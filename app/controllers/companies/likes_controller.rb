class Companies::LikesController < ApplicationController
  before_action :article_params
  def create
    Like.create(company_id: current_company.id, article_id: params[:id])
  end

  def destroy
    Like.find_by(company_id: current_company.id, article_id: params[:id]).destroy
  end

  def article_params
    @article = Article.find(params[:id])
  end
end
