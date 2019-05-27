require 'faker'
FactoryBot.define do

  factory :user do
    sequence(:name) {Faker::Name.first_name}
    sequence(:email) {Faker::Internet.free_email}
    password = Faker::Internet.password(8)
    password {password}
    password_confirmation {password}
  end

end