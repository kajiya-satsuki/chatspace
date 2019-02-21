FactoryBot.define do

  factory :user do
    name {Faker::Name.first_name}
    initialize_with {User.find_or_create_by(name: name)}
    sequence(:email) {Faker::Internet.free_email}
    password = Faker::Internet.password(8)
    password {password}
    password_confirmation {password}
  end

end