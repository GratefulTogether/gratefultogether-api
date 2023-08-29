class Api::V1::WinsController < ApplicationController
  def index
    if params[:date]
      wins = Win.all_by_date(params[:date])
    else
      wins = Win.all_today
    end
    render json: WinSerializer.new(wins)
  end
end