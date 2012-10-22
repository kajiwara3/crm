# Read about factories at http://github.com/thoughtbot/factory_girl
# coding: utf-8
FactoryGirl.define do
  factory :user do
    name "taro"
    name_kana 'taro'
    address 'nanjas'
    email "test@a.com"
    password "password"
    password_confirmation "password"
  end
end