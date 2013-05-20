FactoryGirl.define do
  factory :link do
    pos_x 10
    pos_y 20
    width 100
    height 200
    association :page_version, factory: :page_version
  end
end
