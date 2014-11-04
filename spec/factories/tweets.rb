FactoryGirl.define do
  factory :tweet do
    twitter_id  { Faker::Number.number(10) }
    screen_name { Faker::Internet.user_name }
    tweets_id { Faker::Number.number(10) }
    img_url { Faker::Internet.url('example.com', '/img_url.jpg') }
    text { Faker::Lorem.characters(10) }
  end
end

