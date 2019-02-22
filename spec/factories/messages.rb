FactoryBot.define do

  factory :message do
    body {Faker::Lorem.sentence}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'a_queen_of_a_night.jpg'))}
    user
    group
  end

end