class WinsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "wins_channel"
  end

  def unsubscribed
  end
end
