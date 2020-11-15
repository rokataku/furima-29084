FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanjifamilyname       {"渋井"}
    kanjifirstname        {"拓"}
    kanafamilyname        {"シブイ"}
    first_name_kana       {"タク"}
    birthday              {19880321}
  end
end