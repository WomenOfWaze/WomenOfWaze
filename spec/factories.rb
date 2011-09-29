FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    description { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    price 100
    size "100x100"
    photo { File.new(Rails.root.join('app', 'assets/images', 'rails.png')) }
  end

  factory :category do
    name { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    description { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
  end

  factory :sub_category do
    name { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    description { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
  end

  factory :user do
    email { Faker::Internet.email }
    password { 'A-very-long-password' }
  end
end
