FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    description { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    price 100
    size "100x100"
    photo { File.new(Rails.root.join('app', 'assets/images', 'rails.png')) }
  end
end
