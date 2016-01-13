FactoryGirl.define do
  factory :user do
    sequence(:username) { |u| "new_user_#{u}" }
    sequence(:email) { |u| "new_email_#{u}@example.com" }
  end
end
