class Companies::MatchingsController < ApplicationController
  before_action :authenticate_company!
  before_action :set_matching, only: [:show, :edit, :update, :destroy]
  before_action :search_matching, only: [:index, :search]

  def index
    @matchings = Matching.page(params[:page]).per(10).order('created_at DESC')
  end

  def new
    @matching = Matching.new
  end

  def create
    @matching = Matching.new(matching_params)
    if @matching.save
      redirect_to companies_matchings_path
    else
      render :new
    end
  end

  def show
    @need = Need.find_by_id @matching.need_id
  end

  def edit
  end

  def update
    if @matching.update(matching_params)
      redirect_to companies_matching_path(@matching.id)
    else
      render :edit
    end
  end

  def destroy
    if @matching.destroy
      redirect_to companies_matchings_path
    else
      render :show
    end
  end

  def search
    @results = @p.result(distinct: true).page(params[:page]).per(8).order('created_at DESC')
  end

  private

  def matching_params
    params.require(:matching).permit(:title, :need_id, :area_id, :detail, :end_date, :contact_information, :url).merge(company_id: current_company.id)
  end

  def set_matching
    @matching = Matching.find(params[:id])
  end

  def search_matching
    @p = Matching.ransack(params[:q])
  end
end
