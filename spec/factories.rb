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

  factory :enquiry do
    firstname { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    lastname { Faker::Lorem.words(2).map { |word| word.titleize }.join(' ') }
    email {"#{firstname}_#{lastname}@test.com"}
    country "India"
    remarks "Hi, how are you doing ?"
    phone_country_code 1234
    phone_city_code 12
    phone_number 1234567809
  end

end


#Factory.define :enquiries do |e|
#
#  e.firstname { Faker::Name.first_name }
#  e.lastname { Faker::Name.lasst_name }
#  e.email "#{e.firstname}_#{e.lastname}@test.com"
#  e.country "India"
#  e.remarks "Hi, how are you doing ?"
#  e.phone_country_code 1234
#  e.phone_city_code 12
#  e.phone_number 1234567809
#
#end
