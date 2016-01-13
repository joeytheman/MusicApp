FactoryGirl.define do
  factory :artist do
    name { Faker::Book.publisher }
    genre
  end
end
