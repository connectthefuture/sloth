FactoryGirl.define do
  factory :view do
    association :viewable, factory: :prototype
    association :user, factory: :user
  end
end
