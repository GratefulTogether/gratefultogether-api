require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  before(:each) do 
    @user = create(:user)
  end

  describe "connections" do
    xit "successfully connects" do
      connect "/cable", headers: { 'X-USER-ID' => "#{@user.id}" }
      request_headers = connection.request.headers
      expect(request_headers['X-USER-ID']).to eq("#{@user.id}")
    end

    xit "successfully connects" do
      connect "/cable", headers: { 'X-USER-ID' => "#{@user.id}" }
      require 'pry'; binding.pry
    end
  
    xit "rejects connection" do
      expect { connect "/cable" }.to have_rejected_connection
    end
  end
end