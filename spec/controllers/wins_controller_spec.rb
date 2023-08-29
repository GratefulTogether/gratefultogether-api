require 'rails_helper'

RSpec.describe Api::V1::WinsController, type: :controller do
  describe "POST #create" do
    it "successfully creates a win and broadcasts it to the channel" do
      expect(Win.count).to eq(0)

      user = create(:user)

      expect { post :create, params: {user_id: user.id, message: "test"} }
      .to have_broadcasted_to("wins_channel").exactly(:once)
      .with(a_hash_including("data": a_hash_including("attributes": a_hash_including("entry": "test"))))

      expect(response).to have_http_status(:created)

      expect(Win.count).to eq(1)
      expect(Win.last.user_id).to eq(user.id)
      expect(Win.last.entry).to eq("test")
    end
  end
end