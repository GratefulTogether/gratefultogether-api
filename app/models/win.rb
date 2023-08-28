class Win < ApplicationRecord
  belongs_to :user
  validates_presence_of :entry 

  class << self
    def all_by_date(date)
      where('created_at::date=?', date)
    end

    def all_today
      where('created_at::date=?', Date.today)
    end
  end
end
