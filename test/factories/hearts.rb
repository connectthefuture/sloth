FactoryGirl.define do
  factory :heart do
    association :heartable, factory: :prototype
    association :user, factory: :user
  end
end
