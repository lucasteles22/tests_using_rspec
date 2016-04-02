FactoryGirl.define do
  factory :user, aliases: [:autor] do
    first_name 'Lucas'
    last_name 'Teles'
    email 'lucas@rspec-test.com'
  end
end
