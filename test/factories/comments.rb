FactoryGirl.define do
  factory :comment do
    body "This is a comment"
    association :page_version, factory: :page_version
    association :user, factory: :user
  end

  factory :comment_with_annotation, class: Comment do
    body "This is a comment"
    association :page_version, factory: :page_version
    association :user, factory: :user
    pos_x 10
    pos_y 20
  end
end
