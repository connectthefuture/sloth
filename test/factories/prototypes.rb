FactoryGirl.define do
  factory :prototype do
    name "My First Prototype"
    description "This is my first prototype."
    association :user, factory: :user
  end
end
