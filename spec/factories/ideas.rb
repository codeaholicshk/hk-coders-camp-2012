FactoryGirl.define do
  factory :idea do |idea|
    name "Coding Fast"
    description "Keep Typing Words From Urban Dictionary for 24 hours"
    cool_things ["Practise Typing", "Know 'what dropping kids' means", "Talk to native speakers"]
    idea.association :published_by_account, :factory => :publisher
  end
end