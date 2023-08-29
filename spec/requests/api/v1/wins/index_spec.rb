require "rails_helper"

RSpec.describe "wins search" do
  before(:each) do
    user_1 = User.create!(name: "Wolfie")
    user_2 = User.create!(name: "Maggie")
    user_3 = User.create!(name: "Loki")
    @win_1 = user_1.wins.create!(entry: "I made a friend", created_at: Date.today)
    @win_2 = user_1.wins.create!(entry: "I ate an old chip off the ground", created_at: Date.today)
    @win_3 = user_2.wins.create!(entry: "My mom gave me a carrot", created_at: Date.today)
    @win_4 = user_2.wins.create!(entry: "I found a loaf of bread", created_at: "2023-08-01")
    @win_5 = user_3.wins.create!(entry: "I got some snuggles", created_at: "2023-08-01")
  end

  describe "GET api/v1/wins" do
    it "can get all todays wins" do
      get "/api/v1/wins"
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:data].count).to eq(3)
      parsed[:data].each do |win|
        expect(win[:attributes][:created_at].to_date).to eq(Date.today)
      end
      expect(parsed[:data][0][:attributes][:entry]).to eq("I made a friend")
      expect(parsed[:data][0][:type]).to eq("win")
      expect(parsed[:data][0][:attributes]).to have_key(:user_name)
      expect(parsed[:data][0]).to have_key(:id)
    end 
  end

  describe "GET api/v1/wins?date=2023-08-01" do
    it "can get all wins for given date" do
      get "/api/v1/wins?date=2023-08-01"
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:data].count).to eq(2)
      parsed[:data].each do |win|
        expect(win[:attributes][:created_at].to_date).to eq("2023-08-01".to_date)
      end
      expect(parsed[:data][0][:attributes][:entry]).to eq("I found a loaf of bread")
      expect(parsed[:data][0][:type]).to eq("win")
      expect(parsed[:data][0][:attributes]).to have_key(:user_name)
      expect(parsed[:data][0]).to have_key(:id)
    end
  end
end