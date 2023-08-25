FactoryBot.define do
  factory :win do
    entry { Faker::Movies::BackToTheFuture.quote }
    user
  end
end
