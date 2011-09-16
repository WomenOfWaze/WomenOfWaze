FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
  end
end
