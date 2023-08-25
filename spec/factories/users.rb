FactoryBot.define do
  factory :user do
    name { Faker::Creature::Bird.implausible_common_name }
  end
end
