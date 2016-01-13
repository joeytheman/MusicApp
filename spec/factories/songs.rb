FactoryGirl.define do
  factory :song do
    name { Faker::Book.title }
    artist
    genre
    times_played 22
  end
end
