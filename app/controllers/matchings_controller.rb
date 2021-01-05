class MatchingsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_matching, only: [:index, :search]

  def index
    @matchings = Matching.all
  end

  def new
    @marching = Matching.new
  end

  def create
    @matching = Matching.new(matching_params)
    if @matching.save
      redirect_to matchings_path
    else
      render :new
    end
  end

  def show
    @matching = Matching.find(params[:id])
    @need = Need.find_by_id @matching.need_id
  end

  def search
    @results = @p.result(distinct: true).page(params[:page]).per(8).order('created_at DESC')
  end

  private

  def matching_params
    params.permit(:title, :need_id, :detail, :end_date, :contact_information, :url).merge(user_id: current_user.id)
  end

  def search_matching
    @p = Matching.ransack(params[:q])
  end
end
