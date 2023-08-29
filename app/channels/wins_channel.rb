class WinsChannel < ApplicationCable::Channel
  def subscribed
    # if params[:date]
    #   wins = Win.all_by_date(params[:date])
    # else
    #   wins = Win.all_today
    # end
    puts "blah di blah"
    require 'pry'; binding.pry
    stream_for wins
  end

  def receive(data)
    ActionCable.server.broadcast(wins, data)
  end

  def unsubscribed
  end
end
