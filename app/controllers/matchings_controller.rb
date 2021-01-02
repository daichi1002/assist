class MatchingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @matchings = Matching.all
  end
end
