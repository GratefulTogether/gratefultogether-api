class WinsChannel < ApplicationCable::Channel
  def subscribed
    # if params[:date]
    #   wins = Win.all_by_date(params[:date])
    # else
    #   wins = Win.all_today
    # end
    
    stream_from "wins_channel"
  end

  # def receive(data)
  #   ActionCable.server.broadcast(wins, data)
  # end

  def unsubscribed
  end
end
