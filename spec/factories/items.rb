FactoryBot.define do
  factory :item do
    
    name              { 'シャネルのサッカーボール' }
    detail            { '正規品のボール1ダースです。' }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_fee_id   { 2 }
    shipping_area_id  { 2 }
    shipping_day_id   { 2 }
    price             { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
