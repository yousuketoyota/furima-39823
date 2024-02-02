FactoryBot.define do
  factory :purchaser_address do

    association :user
    association :item

    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_source_id { Faker::Number.between(from: 3, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    building_name { 'ビル' }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
