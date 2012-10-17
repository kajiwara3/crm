# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_magazine do
    subject "MyString"
    body "MyString"
    reserved_date "2012-10-17"
    send_date "2012-10-17"
    canceled_date "2012-10-17"
  end
end
