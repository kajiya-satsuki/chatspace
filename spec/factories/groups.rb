FactoryBot.define do

  factory :group do
    sequence(:name) {Faker::Team.name}
  end

end