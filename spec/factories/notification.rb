FactoryGirl.define do
  factory :notification do
    association :user
    association :issue
  end
end