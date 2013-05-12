FactoryGirl.define do
  factory :page do
    name "My First Page"
    sort 1
    association :prototype, factory: :prototype
    before(:create) do |page|
      page.image = File.open(test_image_file)
    end
  end
end
