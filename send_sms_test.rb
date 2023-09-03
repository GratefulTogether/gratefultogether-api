require 'twilio-ruby'
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
require 'pry'; binding.pry
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
    body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
    from: ENV['TWILIO_PHONE'],
    to: '+13038885386'
  )

puts message.sid