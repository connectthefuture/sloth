FactoryGirl.define do
  factory :page_version do
    sequence(:version){ |t| t }
    before(:create) do |page_version|
      page_version.image = File.open(test_image_file)
    end
  end
end
