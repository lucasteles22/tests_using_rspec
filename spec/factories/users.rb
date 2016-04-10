FactoryGirl.define do
  factory :user, aliases: [:author] do
    first_name 'Lucas'
    last_name 'Teles'
    email 'lucas6@rspec-test.com'

    trait :with_post do
      after(:create) do |author|
        create_list(:post, 3, author: author)
      end
    end

  end
end
