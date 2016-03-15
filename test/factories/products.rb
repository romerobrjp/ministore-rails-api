FactoryGirl.define do
  factory :product do
    title Faker::Commerce.product_name
    price Faker::Number.decimal(2)
    description Faker::Lorem.paragraph(2)
    image Faker::Avatar.image
    active true
  end
end
