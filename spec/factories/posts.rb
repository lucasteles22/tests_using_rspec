  FactoryGirl.define do
  factory :post do
    title 'My custom post'
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor'
    association :author, factory: :user

    factory :post_repproved do
      approved false
    end

    factory :post_approved do
      approved true
    end
  end
end
