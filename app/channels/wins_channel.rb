class WinsChannel < ApplicationCable::Channel
  def subscribed
    users = User.find(params[:user])
    stream_for users
  end

  def unsubscribed
  end
end
