FactoryBot.define do
  factory :item do
    association :user
    title { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category { Category.find_by(id: 2) || association(:category) } # Assuming Category ID 2 is valid
    condition { Condition.find_by(id: 2) || association(:condition) } # Assuming Condition ID 2 is valid
    shipping_fee { ShippingFee.find_by(id: 2) || association(:shipping_fee) } # Assuming ShippingFee ID 2 is valid
    shipping_source { ShippingSource.find_by(id: 2) || association(:shipping_source) } # Assuming ShippingSource ID 2 is valid
    # Assuming ShippingSchedule ID 2 is valid
    shipping_schedule do
      ShippingSchedule.find_by(id: 2) || association(:shipping_schedule)
    end
    # belongs_to :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png', content_type: 'image/png')
    end
  end
end
