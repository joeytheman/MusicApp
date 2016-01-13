FactoryGirl.define do
  factory :genre do
    sequence(:name) { |n| "#{Faker::Book.genre} #{n}"}
  end
end
