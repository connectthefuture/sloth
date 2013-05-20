FactoryGirl.define do
  factory :page do
    name "My First Page"
    sort 1
    association :prototype, factory: :prototype
    before(:create) do |page|
      page.page_versions << FactoryGirl.create(:page_version)
    end
  end
end
