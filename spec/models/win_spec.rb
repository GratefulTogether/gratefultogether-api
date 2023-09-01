require 'rails_helper'

RSpec.describe Win, type: :model do
  it {should belong_to :user}
  it {should validate_presence_of :entry}

  describe 'class methods' do
    before(:each) do 
      user_1 = create(:user)
      user_2 = create(:user)
      create_list(:win, 2, created_at: "2021-09-01 00:00:00", user: user_1)
      create_list(:win, 3, created_at: "2021-09-01 00:00:00", user: user_2)

      create_list(:win, 2, created_at: "2021-09-02 00:00:00", user: user_1)
      create_list(:win, 4, created_at: "2021-09-02 00:00:00", user: user_2)
      @day_1 = "2021-09-01 00:00:00"
      @day_2 = "2021-09-02 00:00:00"
    end

    it '#all_by_date' do 
      day_one_wins = Win.all_by_date(@day_1)
      expect(day_one_wins.count).to eq(5)

      day_one_wins.each do |win|
        expect(win.created_at).to eq(@day_1)
      end

      day_two_wins = Win.all_by_date(@day_2)
      expect(day_two_wins.count).to eq(6)

      day_two_wins.each do |win|
        expect(win.created_at).to eq(@day_2)
      end
    end

    it '#all_today' do 
      user = create(:user)
      win_1 = create(:win, user: user, created_at: Date.today)
      win_2 = create(:win, user: user, created_at: Date.today)

      today_wins = Win.all_today
      expect(today_wins.count).to eq(2)
      expect(today_wins).to eq([win_1, win_2])
    end
  end
end
