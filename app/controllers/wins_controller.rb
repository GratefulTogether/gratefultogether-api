class WinsController < ApplicationController
  def create
    win = Win.new(win_params)
    win = Win.find(win_params[:user_id])
    if user.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        WinSerializer.new(win)
      ).serializable_hash
      WinsChannel.broadcast_to user, serialized_data
      head :ok
    end
end