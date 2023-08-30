require 'rails_helper'

RSpec.describe "Wins Create" do
  describe "POST api/v1/wins" do
    it "successfully creates a win" do
      expect(Win.count).to eq(0)

      user = User.create!(name: "Wolfie")

      win_params = { user_id: user.id, message: "test" }

      post "/api/v1/wins", params: win_params

      expect(response).to be_successful
      expect(response.status).to eq(201)

      win = JSON.parse(response.body, symbolize_names: true)

      expect(win[:data]).to have_key(:id)
      expect(win[:data]).to have_key(:type)
      expect(win[:data][:type]).to eq("win")
      expect(win[:data][:attributes]).to have_key(:user_name)
      expect(win[:data][:attributes][:user_name]).to eq(user.name)
      expect(win[:data][:attributes]).to have_key(:entry)
      expect(win[:data][:attributes][:entry]).to eq(Win.last.entry)
      expect(win[:data][:attributes]).to have_key(:created_at)
    end

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