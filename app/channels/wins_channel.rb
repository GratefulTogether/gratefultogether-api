class WinsChannel < ApplicationCable::Channel
  def subscribed
    if params[:date]
      wins = Win.all_by_date(params[:date])
    else
      wins = Win.all_today
    end
    require 'pry'; binding.pry
    stream_for wins
  end

  # def receive(data)
    
  #   # ActionCable.server.broadcast("chat_#{params[:room]}", data)
  #   # puts data
  # end

  def unsubscribed
  end
end
