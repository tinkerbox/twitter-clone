FactoryGirl.define do
  factory :user do |u|
    sequence(:email) { |n| "person#{n}@email.com" }
    sequence(:username) { |n| "user#{n}" }
    name "John Doe"
    password "password123"
    password_confirmation "password123"

    u.tweets { |tweet| [tweet.association(:tweet)] }
  end
end