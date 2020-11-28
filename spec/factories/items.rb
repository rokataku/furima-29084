FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.sentence }
    discription      { Faker::Lorem.sentence }
    category_id      { 2 }
    status_id        { 2 }
    shippingfee_id   { 2 }
    prefecture_id    { 2 }
    shippingdate_id  { 2 }
    price            { 500 }
    association      :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
