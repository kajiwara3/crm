# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :magazine_target do
    name "MyString"
    email "MyText"
    send_date "2012-10-17"
    validity false
  end
end
