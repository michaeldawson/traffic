# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :route do
    route_from "MyString"
    route_to "MyString"
    start_time "MyString"
    end_time "MyString"
  end
end
