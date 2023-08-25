require 'rails_helper'

RSpec.describe Win, type: :model do
  it {should belong_to :user}
  it {should validate_presence_of :entry}
end
