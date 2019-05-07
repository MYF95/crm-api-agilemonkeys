FactoryBot.define do
  factory :customer do
    name { Faker::Games::WorldOfWarcraft.hero }
    surname { Faker::Games::SonicTheHedgehog.game }
    created_by { Faker::Number.number(10) }
    updated_by { Faker::Number.number(10) }
  end
end