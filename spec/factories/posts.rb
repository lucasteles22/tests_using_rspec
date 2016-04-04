  FactoryGirl.define do
  factory :post do
    title 'My custom post'
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor'
    association :author, factory: :user

    trait :repproved do
      approved false
    end

    trait :approved do
      approved true
    end

    factory :post_approved, traits: [:approved]
    factory :post_repproved, traits: [:repproved]
  end
end
