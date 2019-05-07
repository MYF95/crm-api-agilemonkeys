FactoryBot.define do
  factory :customer do
    name { Faker::Games::WorldOfWarcraft.hero }
    surname { Faker::Games::SonicTheHedgehog.game }
    created_by { Faker::Number.number(10) }
    updated_by { Faker::Number.number(10) }

    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new("#{Rails.root}/public/images/default_avatar.png") }
    end
  end
end