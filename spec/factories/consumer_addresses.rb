FactoryBot.define do
  factory :consumer_address do
    postal_code { '111-1111' }
    prefecture_id { 1 }
    city {'豊島区'}
    house_number { '1-1' }
    building_name { '目白ハウス' }
    phonenumber { '12345678910'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
