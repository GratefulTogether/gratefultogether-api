class WinsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wins_channel"
  end
  
  def unsubscribed
  end
end
