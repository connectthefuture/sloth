FactoryGirl.define do
  factory :page do
    name "My First Page"
    sort 1
    association :prototype, factory: :prototype
  end
end
