class Api::V1::WinsController < ApplicationController
  def index
    if params[:date]
      wins = Win.all_by_date(params[:date])
    else
      wins = Win.all_today
    end
    render json: WinSerializer.new(wins)
  end

  def create
    user = User.find(params[:user_id])
    win = user.wins.new(entry: params[:message])
    if win.save
      WinsChannel.broadcast_to(@wins, WinSerializer.new(win))
      render json: WinSerializer.new(win), status: :created
    end
  end

  private

  def win_params
    params.permit(:entry)
  end
end