class Api::V1::WinsController < ApplicationController
  def index
    # if params[:date]
    #   wins = Win.all_by_date(params[:date])
    # else
    #   wins = Win.all_today
    # end
    # render json: WinSerializer.new(wins)
  end

  def create
    # win = Win.new(win_params)
    # win = Win.find(win_params[:user_id])
    # if user.save
    #   serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #     WinSerializer.new(win)
    #   ).serializable_hash
    #   WinsChannel.broadcast_to user, serialized_data
    #   head :ok
    # end
  end
end