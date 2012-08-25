FactoryGirl.define do
  factory :comment do |comment|
    comment.association :idea
    message "Awesome"
  end
end