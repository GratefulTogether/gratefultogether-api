class Api::V1::WinsChannel < ApplicationCable::Channel
  def subscribed
    if params[:date]
      wins = Win.all_by_date(params[:date])
    else
      wins = Win.all_today
    end
    stream_for wins
  end

  # def receive(data)
  #   ActionCable.server.broadcast("chat_#{params[:room]}", data)
  # end

  def unsubscribed
  end
end
