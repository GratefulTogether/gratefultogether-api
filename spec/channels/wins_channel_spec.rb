require 'rails_helper'

RSpec.describe WinsChannel, type: :channel do
  it "successfully subscribes" do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("wins_channel")
  end
end
