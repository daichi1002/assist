class Companies::MatchingsController < ApplicationController
  before_action :authenticate_company!

  def index
    @matchings = Matching.all
  end
end
