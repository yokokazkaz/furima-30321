FactoryBot.define do
  factory :order_address do
    token {'tok_da877832466b2798051d44df9925'}
    postal_code {'111-2222'}
    prefecture_id { 3 }
    city {'横浜市'}
    address {'1-2-3'}
    phone_number {'09055556666'}
  end
end
