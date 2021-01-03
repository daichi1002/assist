class Companies::MatchingsController < ApplicationController
  before_action :authenticate_company!

  def index
    @matchings = Matching.all
  end

  def new
    @marching = Matching.new
  end

  def create
    @matching = Matching.new(matching_params)
    if @matching.save
      redirect_to companies_matchings_path
    else
      render :new
    end
  end
end
