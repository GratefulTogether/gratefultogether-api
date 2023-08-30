require 'rails_helper'

RSpec.describe "Wins Create" do
  describe "POST api/v1/wins" do
    it "does not create a win and returns an error message if entry is blank" do
      expect(Win.count).to eq(0)

      user = User.create!(name: "Wolfie")

      win_params = { user_id: user.id, message: "" }

      post "/api/v1/wins", params: win_params

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      win = JSON.parse(response.body, symbolize_names: true)

      expect(win[:errors]).to eq(["Entry can't be blank"])
      expect(Win.count).to eq(0)
    end
  end
end