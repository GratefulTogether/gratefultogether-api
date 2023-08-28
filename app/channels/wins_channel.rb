class WinsChannel < ApplicationCable::Channel
  def subscribed
    wins = 
    stream_for wins
  end

  def unsubscribed
  end
end
